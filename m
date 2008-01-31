From: Vincent Arniego <vincent_arniego@yahoo.com>
Subject: Re: [NFQUEUE] Help with program that changes DHCP payload
Date: Wed, 30 Jan 2008 22:02:02 -0800 (PST)
Message-ID: <795485.18049.qm@web58315.mail.re3.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@vger.kernel.org



Stop 
right 
there. 
The 
ISC 
DHCP 
server 
does 
very 
funky 
stuff 
to 
see 
packets 
addressed 
to 
0.0.0.0. 
This 
means 
those 
packets 
do 
not 
go 
through 
netfilter. 
I 
bet 
this 
is 
at 
the 
root 
of 
your 
problem.

-- it actually does, I experimented with just changing the TOS of the UDP packet and somehow
I was successful. Though I have to take note that somehow, DHCP is still able to send a DHCP reply
even if the nfqueue program is running, maybe you're right about that as well.

I 
cannot 
think 
of 
a 
quick 
way 
to 
change 
this. 
Maybe 
hacking 
at 
dhcrelay 
sources 
is 
an 
better 
option.

-- too bad a dhcrelay in between is not feasible at the moment, I am thinking about this actually.
I'll check if I'm able to do this somehow, but I doubt it if its implementable.

Thanks for the help.

HTH,
M4

-
To 
unsubscribe 
from 
this 
list: 
send 
the 
line 
"unsubscribe 
netfilter" 
in
the 
body 
of 
a 
message 
to 
majordomo@vger.kernel.org
More 
majordomo 
info 
at  
http://vger.kernel.org/majordomo-info.html





      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs
