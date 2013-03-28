
DECLARE              @return_value int

EXEC      @return_value = [Framework.].[ChangeBaseURI]
                                @oldBaseURI = N'http://profiles.ucsf.edu/profile/',
                                @newBaseURI = N'http://stage-profiles.ucsf.edu/profiles103/profile/'

SELECT  'Return Value' = @return_value

GO
-- check first!!

update [Framework.].Parameter set Value = 'http://stage-profiles.ucsf.edu/profiles103' where ParameterID = 'basePath'
update [Framework.].Parameter set Value = 'http://stage-profiles.ucsf.edu/profiles103/profile/' where ParameterID = 'baseURI'