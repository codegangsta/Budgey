#import <SenTestingKit/SenTestingKit.h>
#import "LSInjector.h"

@interface TestLSInjector : SenTestCase{
@private
    NSString *$testString;
    char $anotherTest;
}
// sample injection property
@property (nonatomic, strong) NSString *$testString;
@property (nonatomic) char $anotherTest;

@end

@implementation TestLSInjector


@synthesize $testString;
@synthesize $anotherTest = $anotherTest;


- (void)setUp
{
    [super setUp];

    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.

    [super tearDown];
}

- (void)testGetWithString
{
    LSInjector *injector = [[LSInjector alloc] init];

    STAssertNil([injector get:[NSString class]], @"Get should return nil since we did not map anything to the injector");
}

- (void)testMapToClassWithString
{
    LSInjector *injector = [[LSInjector alloc] init];
    [injector map:@"HelloWorld" toClass:[NSString class]];

    STAssertNotNil([injector get:[NSString class]], @"Mapping of class NSString should not be nil");
}

- (void)testApplyWithString
{
    LSInjector *injector = [[LSInjector alloc] init];
    STAssertThrows([injector apply:self], @"Apply should throw exception if dependency can not be satisfied");

    [injector map:@"HelloWorld" toClass:[NSString class]];
    [injector apply:self];
    STAssertEqualObjects(@"HelloWorld", $testString, @"Injected value should match with the mapped value");
}

@end