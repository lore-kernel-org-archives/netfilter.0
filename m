From: Jaco Kroon <jaco@uls.co.za>
Subject: libipset usability suggestions/advise
Date: Mon, 26 Dec 2011 22:23:42 +0200
Message-ID: <4EF8D7CE.1070106@uls.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Guys,

I've spent most of the day trying to hook directly into libipset, and 
eventually gave up settling for interacting with ipset via system() and 
popen() using the command line.

I may be a special case, but I suspect it would be useful to firewall 
like applications to be able to interact with ipset's via a library 
interface, especially if it becomes possible to get notifications etc on 
when things happen.  As I understand it it's possible to do a lot of 
this via libnml, however, this is still a "generic" interface, and 
libipset seems like the logical choice when required to interact with ipset.

Firstly, I must say that the overall design is very nice and mostly very 
clean, and extremely generic, it's easy to follow and would be very easy 
to add new options etc to the codebase.  My stumbling blocks however was 
as follows:

1.  I need to duplicate the various ipset_type structures into my own 
code in which I'm interested.  I would suggest that this goes into the 
library and get loaded as part of some library initialization call 
(possibly even internal to ipset_session_init).

2.  The ability to retrieve set information into a structure and query 
it from there would be awesome.  As it stands I need to invoke 
ipset_cmd() to get anything done, this handles a few internal 
intialization routines and so forth, which is all fair and well, but 
then makes assumptions about the way in which I'd like to have the data 
returned from the kernel handled.  In my case I don't care about 
outputting things, my program takes a -s setname and I'd like to check that:

   a)  the type is correctly set as hash:ip.
   b)  it has timeout support enabled.

3.  In my particular case I simply want to periodically add entries to 
the ipset in question, so the concept of a line number in ipset_cmd 
makes no sense to me, just passing zero is an easy workaround.

4.  The fact that the session gets reset after every ipsec_cmd call 
makes perfect sense an "interactive" use case where a user types 
multiple commands one after the other on a prompt, but it requires me to 
have to re-set the options I care about every single invocation where 
I'd prefer to just set up the setname and timeout options beforehand, 
and then just alter the IPSET_OPT_IP value every time before invoking 
libipset to make the actual work happen.

Based on what I've seen I can envision that this should all be 
possible.  In particular I think if one can split ipset_cmd into smaller 
(exposed) parts it would make sense, in particular transport 
initialization and pre-call initialization really, then the invocation 
of commands (possibly with custom call-backs so one can for example get 
hold of the type data and the like, basically this info:

Name: foo
Type: hash:ip
Header: family inet hashsize 1024 maxelem 65536
Size in memory: 16504
References: 0

in a structured way (even if one have to query it using the various 
ipset_data_test/get functions, in fact - that would be very cool).

I would like to extend my help in this regards if it would make sense to 
do so.  I don't think I'm capable to do all of the above, but I may at 
least be capable of performing at least some of the above.  I would 
however (before I proceed) like to know whether such patches would be 
welcome and whether they would stand a chance of being merged.

If I am missing the boat completely and what I want is already possible 
in some way, please do point me in the right direction.

Kind Regards,
Jaco
