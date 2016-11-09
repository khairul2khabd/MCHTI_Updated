<%-- 
    Document   : main
    Created on : Nov 8, 2016, 12:28:03 AM
    Author     : Khairul
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/js_css.jsp"%> 

<html>
    <head>  
        <title>AngularJS ngResource Example</title>  
        <style>
            .username.ng-valid {
                background-color: lightgreen;
            }
            .username.ng-dirty.ng-invalid-required {
                background-color: red;
            }
            .username.ng-dirty.ng-invalid-minlength {
                background-color: yellow;
            }

            .email.ng-valid {
                background-color: lightgreen;
            }
            .email.ng-dirty.ng-invalid-required {
                background-color: red;
            }
            .email.ng-dirty.ng-invalid-email {
                background-color: yellow;
            }

            body, #mainWrapper {
                height: 70%;
                background-color:rgb(245, 245, 245);
            }

            body, .form-control{
                font-size:12px!important;
            }

            .floatRight{
                float:right;
                margin-right: 18px;
            }

            .has-error{
                color:red;
            }

            .formcontainer{
                background-color: #DAE8E8;
                padding: 20px;
            }

            .tablecontainer{
                padding-left: 20px;
            }

            .generic-container {
                width:80%;
                margin-left: 20px;
                margin-top: 20px;
                margin-bottom: 20px;
                padding: 20px;
                background-color: #EAE7E7;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-shadow: 0 0 30px black;
            }

            .custom-width {
                width: 80px !important;
            }

        </style>

    </head>
    <center>
        <body ng-app  class="ng-cloak">

            <div class="generic-container" ng-controller="UserController as ctrl">
                <div class="panel panel-default">
                    <div class="panel-heading"><span class="lead">User Registration Form a </span></div>
                    <div class="formcontainer">
                        <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                            <input type="hidden" ng-model="ctrl.user.id" />
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label class="col-md-2 control-lable" for="uname">Name</label>
                                    <div class="col-md-7">
                                        <input type="text" ng-model="ctrl.user.username" id="uname" class="username form-control input-sm" placeholder="Enter your name" required ng-minlength="3"/>
                                        <div class="has-error" ng-show="myForm.$dirty">
                                            <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                            <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                            <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label class="col-md-2 control-lable" for="address">Address</label>
                                    <div class="col-md-7">
                                        <input type="text" ng-model="ctrl.user.address" id="address" class="form-control input-sm" placeholder="Enter your Address. [This field is validation free]"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label class="col-md-2 control-lable" for="email">Email</label>
                                    <div class="col-md-7">
                                        <input type="email" ng-model="ctrl.user.email" id="email" class="email form-control input-sm" placeholder="Enter your Email" required/>
                                        <div class="has-error" ng-show="myForm.$dirty">
                                            <span ng-show="myForm.email.$error.required">This is a required field</span>
                                            <span ng-show="myForm.email.$invalid">This field is invalid </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-actions floatRight">
                                    <input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                                    <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading"><span class="lead">List of Users </span></div>
                    <div class="tablecontainer">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID.</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Email</th>
                                    <th width="20%"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="u in ctrl.users">
                                    <td><span ng-bind="u.id"></span></td>
                                    <td><span ng-bind="u.username"></span></td>
                                    <td><span ng-bind="u.address"></span></td>
                                    <td><span ng-bind="u.email"></span></td>
                                    <td>
                                        <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </body>
    </center>
</html>

<%@ include file="/WEB-INF/template/footer.jsp"%>