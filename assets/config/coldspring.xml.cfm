<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN" "http://www.springframework.org/dtd/spring-beans.dtd">

<beans default-autowire="byName">

	<bean id="appSettings" autowire="no" class="fw1test.model.config">
		<property name="config">
			<map>
				<entry key="dsn"><value>${dsn}</value></entry>
			</map>
		</property>
	</bean>

	<bean id="ParentConfig" autowire="no" abstract="true">
		<constructor-arg name="settings"><ref bean="appSettings" /></constructor-arg>
	</bean>

	<bean id="userService" autowire="no" class="fw1Test.model.userService">
		<constructor-arg name="userGateway"><ref bean="userGateway"/></constructor-arg>
	</bean>
	<bean id="userGateway" autowire="no" parent="ParentConfig" class="fw1Test.model.userGateway" />

</beans>