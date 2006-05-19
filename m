From: "bimal  pandit" <bimal_pandit@rediffmail.com>
Subject: [OT] Important Issue with "TIME" as we had with Y2K.
Date: 19 May 2006 18:31:14 -0000
Message-ID: <20060519183114.3000.qmail@webmail64.rediffmail.com>
Reply-To: bimal  pandit <bimal_pandit@rediffmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <ilug-bounces@linux.ie>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mail.linux.ie/mailman/listinfo/ilug>,
	<mailto:ilug-request@linux.ie?subject=unsubscribe>
List-Archive: <http://mail.linux.ie/pipermail/ilug>
List-Post: <mailto:ilug@linux.ie>
List-Help: <mailto:ilug-request@linux.ie?subject=help>
List-Subscribe: <http://mail.linux.ie/mailman/listinfo/ilug>,
	<mailto:ilug-request@linux.ie?subject=subscribe>
Sender: ilug-bounces@linux.ie
Errors-To: ilug-bounces@linux.ie
Content-Type: text/plain; charset="windows-1252"
To: ilug@linux.ie, phpug@lists.iephpug.org, squid-users@squid-cache.org, netfilter@lists.netfilter.org, Ext3-users@redhat.com, listmanager@lists.sendmail.org, dulug@dulug.duke.edu

Dear User,

In my previous article published in darpan 28/04/06 I mentioned  =93 techno=
logy is changing rapidly and there could be some unanticipated issues=94, s=
o here is the time to look into one...

"Date" is one of the well known representation of "Time" and plays a critic=
al role in our life. Just for an example our financial transactions, Import=
ant events, various schedules etc. all are directly related to "date/time",=
 similarly it plays an important role in IT industry, our system uses date =
for various purposes e.g. various updates, application/program execution, b=
ackup schedules etc. etc. etc. and hence any variation, misrepresentation, =
error may lead to a great consequences. I hope you all remember Year 2000(Y=
2K) problem, just for ready reminder - in fact it was the way we represent =
"date" i.e. 05/05/75 is 5th May 1975, so date could be of maximum two digit=
s(01-31), month could be of maximum two digits(01-12) but year needs to be =
four digits till "9999" and hence system could have gone haywire after the =
midnight of 31st December 1999 when the date was 01/01/00. This was what???=
 start of the first century or the twenty first century(1st January 2000)??=
?, this misrepresentation and use had a great implications!!! but things we=
re controlled soon with the change in this format, you all know that.=20

But, why I am discussing all these???  OK, let me tell you another such an =
issue its "Year 2038 Problem", just go through this article which I have re=
ceived long ago in a LINUX user group from Mr.Nitin Gupta, CEO, Xaprio Solu=
tions.
			------------ SNIP ---------------
The Year 2038 Problem, Test it now...
Disclaimer : This is just for FYI only. This  is true and if you do this do=
 at your own risk!!!
 1. login to yahoo messenger(YM)/Gaim
 2. send instant message to anyone - fine its working...
 3. now, change your system date to 19-Jan-2038, 03:14:07 AM or above
 4. Confirm weather your date is changed
 5. again send instant message to anyone...
 Your YM/GAIM crashes ...
 * * YES ALL NETWORK BASED APPLICATION WILL NOT WORK NOW AND YOU MAY FACE I=
SSUES WITH OTHERS * *
=20
Why...,  What is it?
 Starting at GMT 03:14:07, Tuesday, January 19, 2038, It is expected to see=
 lots of systems around the world breaking magnificently: satellites fallin=
g out of orbit, massive power outages (like the 2003 North American blackou=
t), hospital life support system failures, phone system interruptions, bank=
ing errors, etc. One second after this critical second, many of these syste=
ms will have wildly inaccurate date settings, producing all kinds of unpred=
ictable consequences. In short, many of the dire predictions for the year 2=
000 are much more likely to actually occur in the year 2038!=20

Consider the year 2000 just a dry run. In case you think we can sit on this=
 issue for another 30 years before addressing it, consider that reports of =
temporal echoes of the 2038 problem are already starting to appear in futur=
e date calculations for mortgages and vital statistics! In the first month =
of the year 2038 C.E. many computers will encounter a date-related bug in t=
heir operating systems and/or in the applications they run. This can result=
 in incorrect and wildly  inaccurate dates being reported by the operating =
system and/or applications. The effect of this bug is hard to predict, beca=
use many applications are not prepared for the resulting "skip" in reported=
 time anywhere from 1901 to a "broken record" repeat of the reported time a=
t the second the bug occurs. Also, may make some small adjustment to the ac=
tual time the bug expresses itself. This bug to cause serious problems on m=
any platforms, especially Unix and Unix-like platforms, because these syste=
ms will "run out of time".
=20=20
What causes it?
Time_t is a data type used by C and C++ programs to represent dates and tim=
es internally. (Windows programmers out there might also recognize it as th=
e basis for the CTime and CTimeSpan classes in MFC.) time_t is actually jus=
t an integer, a whole number, that counts the number of seconds since Janua=
ry 1, 1970 at 12:00 AM Greenwich Mean Time. A time_t value of 0 would be 12=
:00:00 AM (exactly midnight) 1-Jan-1970, a time_t value of 1 would be 12:00=
:01 AM (one second after midnight) 1-Jan-1970, etc..
=20
some example times and their exact time_t representations:
Date & time time_t representation
1-Jan-1970, 12:00:00 AM GMT 0
1-Jan-1970, 12:01:00 AM GMT 60
1-Jan-1970, 01:00:00 AM GMT 3 600
2-Jan-1970, 12:00:00 AM GMT 86 400
1-Jan-1971, 12:00:00 AM GMT 31 536 000
1-Jan-1972, 12:00:00 AM GMT 63 072 000
1-Jan-2038, 12:00:00 AM GMT 2 145 916 800

By the year 2038, the time_t representation for the current time will be ov=
er 2 140 000 000. And that's the problem. A modern 32-bit computer stores a=
 "signed integer" data type, such as time_t, in 32 bits. The first of these=
 bits is used for the positive/negative sign of the integer, while the rema=
ining 31 bits are used to store the number itself.
=20=20
The highest number these 31 data bits can store works out to exactly 2 147 =
483 647. A time_t value of this exact number, 2 147 483 647, represents Jan=
uary 19, 2038, at 7 seconds past 3:14 AM Greenwich Mean Time. So, at 3:14:0=
7 AM GMT on that fateful day, every time_t used in a 32-bit C  or C++ progr=
am will reach its upper limit. One second later, on 19-January-2038 at 3:14=
:08 AM GMT, disaster strikes. When a signed integer reaches its maximum val=
ue and then gets incremented, it wraps around to its lowest possible negati=
ve value. This means a 32-bit signed integer, such as a time_t, set to its =
 maximum value of 2 147 483 647 and then incremented by 1, will become -2 1=
47 483 648. Note that "-" sign at the beginning of this large number. A tim=
e_t value of -2 147 483 648 would represent December 13, 1901 at 8:45:52 PM=
 GMT. So, if all goes normally, 19-January-2038 will suddenly become 13-Dec=
ember-1901 in every time_t across the globe, and every date calculation bas=
ed on this figure will go haywire. And it gets worse. Most of the support f=
unctions that use the time_t data type cannot handle negative time_t values=
 at all. They simply fail and return an error code.
=20
Solution
"The best way to predict the future is to engineer it." Consider testing yo=
ur mission-critical code well ahead of time on a non-production test platfo=
rm set just before the critical date. For more general applications, just u=
sing large types for storing dates will do the trick in most cases. For exa=
mple, in GNU C, 64-bits (a "long " type) is sufficient to keep the time fro=
m rolling over for literally geological eons This just means any executable=
s the operating systems runs will always get the correct time reported to t=
hem when queried in the correct manner.  It doesn't stop the executables yo=
u may still want to be worried about Well-written programs can simply be re=
compiled with a new version of the library that uses, for example, 8-byte v=
alues for the storage format. This is possible because the library encapsul=
ates the whole time activity with its own time types and functions (unlike =
most mainframe programs, which did not standardize their date formats or ca=
lculations). So the Year 2038 problem should not be nearly as hard to fix a=
s the Y2K problem was.

Admittedly, some don't feel that this impending disaster will strike too ma=
ny people. They reason that, by the time 2038 rolls around, most programs w=
ill be running on 64-bit or even 128-bit computers. In a 64-bit program, a =
time_t could represent any date and time in the future out to 292 000 000 0=
00 A.D., which is about 20 times the currently estimated age of the univers=
e. The problem with this kind of optimism is the same root problem behind m=
ost of the Year 2000 concerns that plagued the software industry in previou=
s years: Legacy Code. Even if every PC in the year 2038 has a 64-bit CPU, t=
here will be a lot of older 32-bit programs running on them.  The greatest =
danger with the Year 2038 Problem is its invisibility. The more-famous Year=
 2000 is a big, round number; it only takes a few seconds of thought, even =
for a computer-illiterate person, to imagine what might happen when 1999 tu=
rns into 2000. But January 19, 2038 is not nearly as  obvious. Software com=
panies will probably not think of trying out a Year 2038 scenario before do=
omsday strikes. Of course, there will be some warning ahead of time. Schedu=
ling software,billing programs, personal reminder calendars, and other such=
 pieces of code that set dates in the near future will fail as soon as one =
of their target dates exceeds 19-Jan-2038, assuming a time_t is used to sto=
re them.
			------------ SNIP ---------------
OK, so by that time I don't know where we will be and what would be the tec=
hnology, but the message is clear. In the last let Me ask you a very intere=
sting question...

could you tell me what was the day of the week on 3rd Sept. 1752 ? No!!!, O=
K, then have a choice and tell me for any of these 5th Sept. 1752, 9th Sept=
. 1752, 12th Sept. 1752.

regards,

Bimal Pandit=
-- 
Irish Linux Users' Group mailing list
About this list : http://mail.linux.ie/mailman/listinfo/ilug
Who we are : http://www.linux.ie/
Where we are : http://www.linux.ie/map/
