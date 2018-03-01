/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <WCDB/WCTCoding.h>
#import <WCDB/WCTDelete+Private.h>
#import <WCDB/WCTDelete.h>
#import <WCDB/WCTInsert+Private.h>
#import <WCDB/WCTInsert.h>
#import <WCDB/WCTMultiSelect+Private.h>
#import <WCDB/WCTMultiSelect.h>
#import <WCDB/WCTProperty.h>
#import <WCDB/WCTRowSelect+Private.h>
#import <WCDB/WCTRowSelect.h>
#import <WCDB/WCTSelect+Private.h>
#import <WCDB/WCTSelect.h>
#import <WCDB/WCTTable+ChainCall.h>
#import <WCDB/WCTTable+Private.h>
#import <WCDB/WCTUpdate+Private.h>
#import <WCDB/WCTUpdate.h>

@implementation WCTTable (ChainCall)

- (WCTInsert *)prepareInsertObjects
{
    return [[WCTInsert alloc] initWithDatabase:_database andProperties:[_class AllProperties] andTableName:_tableName andReplaceFlag:NO];
}

- (WCTInsert *)prepareInsertOrReplaceObjects
{
    return [[WCTInsert alloc] initWithDatabase:_database andProperties:[_class AllProperties] andTableName:_tableName andReplaceFlag:YES];
}

- (WCTInsert *)prepareInsertObjectsOnProperties:(const WCTPropertyList &)properties
{
    return [[WCTInsert alloc] initWithDatabase:_database andProperties:properties andTableName:_tableName andReplaceFlag:NO];
}

- (WCTInsert *)prepareInsertOrReplaceObjectsOnProperties:(const WCTPropertyList &)properties
{
    return [[WCTInsert alloc] initWithDatabase:_database andProperties:properties andTableName:_tableName andReplaceFlag:YES];
}

- (WCTDelete *)prepareDelete
{
    return [[WCTDelete alloc] initWithDatabase:_database andTableName:_tableName];
}

- (WCTUpdate *)prepareUpdateOnProperties:(const WCTPropertyList &)properties
{
    return [[WCTUpdate alloc] initWithDatabase:_database andProperties:properties andTableName:_tableName];
}

- (WCTSelect *)prepareSelectObjects
{
    return [[WCTSelect alloc] initWithDatabase:_database andProperties:[_class AllProperties] fromTable:_tableName isDistinct:NO];
}

- (WCTSelect *)prepareSelectObjectsOnProperties:(const WCTPropertyList &)properties
{
    return [[WCTSelect alloc] initWithDatabase:_database andProperties:properties fromTable:_tableName isDistinct:NO];
}

- (WCTSelect *)prepareSelectObjectsOnProperties:(const WCTPropertyList &)properties isDistinct:(BOOL)isDistinct
{
    return [[WCTSelect alloc] initWithDatabase:_database andProperties:properties fromTable:_tableName isDistinct:isDistinct];
}

- (WCTRowSelect *)prepareSelectRows
{
    return [[WCTRowSelect alloc] initWithDatabase:_database andResultColumns:{WCDB::ResultColumn::All} fromTables:@[ _tableName ] isDistinct:NO];
}

- (WCTRowSelect *)prepareSelectRowsOnResults:(const std::list<WCDB::ResultColumn> &)resultColumns
{
    return [[WCTRowSelect alloc] initWithDatabase:_database andResultColumns:resultColumns fromTables:@[ _tableName ] isDistinct:NO];
}

- (WCTRowSelect *)prepareSelectRowsOnResults:(const std::list<WCDB::ResultColumn> &)resultColumns isDistinct:(BOOL)isDistinct
{
    return [[WCTRowSelect alloc] initWithDatabase:_database andResultColumns:resultColumns fromTables:@[ _tableName ] isDistinct:isDistinct];
}

@end
