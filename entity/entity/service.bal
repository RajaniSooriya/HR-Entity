// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.
//
// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
// You may not alter or remove any copyright or other notice from copies of this content.

import ballerina/graphql;

const EFFECTIVE_DAYS_FIELD = "effectiveDays";
const NUMBER_OF_DAYS_FIELD = "numberOfDays";

@display {
    label: "HR Entity GraphQL Service",
    id: "hris/entity-graphql-service"
}

type LeavePolicy record  {
    int no;
    int tt;
};
service /graphql on new graphql:Listener(9090) {

    # Get a specific career functions for a given career function id (graphql query).
    #
    # + careerFunctionId - Id of the career function
    # + return - Career function | Null | Error
    resource function get careerFunction(int careerFunctionId) returns LeavePolicy[]|error {

        return [{no:1, tt:2}, {no:3, tt:4}];
    }

}