From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: A little help?
Date: Sat, 15 Nov 2003 13:17:09 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311152117.hAFLH5D1021363@server5.bandwidthco.com>
References: <9911B83A96D5CF44B5F326FF60E6EB6906780F@mailsvr.leadingside.com.my>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9911B83A96D5CF44B5F326FF60E6EB6906780F@mailsvr.leadingside.com.my>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Chris Winfield-Blum' <chris@leadingside.com.my>, netfilter@lists.samba.org

Chris - couple of questions for you:

1.  You have supplied two scripts here.  Which one are you trying to use, or
which one do you want help with to solve your problem?  That will help
narrow the focus down.

2.  What specific problems are you having now with your firewall?  You
mention that Guard Dog is "stuffing up" iptables, but this means very little
to me.  If you could be more specific as to what is not working that would
be helpful.

3.  What type of connection are your internal clients connected to?  Do they
have static IP's, or are they being assigned IP's by DHCP?

4.  You have several Rule chains defined (i.e. firewalled, tcpflags,
silent), and yet I don't see any rules for these.  What are you trying to do
here?

Clear up some of these questions and issues, and someone may be able to help
you.  Right now, there are too many unknowns and unexplained issues.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Chris
Winfield-Blum
Sent: Friday, November 14, 2003 12:46 AM
To: netfilter@lists.samba.org
Subject: A little help?

Hi everyone.. i hope that one of you may be able to help...

Hi my name is Chris and I'm currently setting up a firewall for my office.
However I am pretty much a novice and am having some problems... I read one
of your scripts and thought you would be a good person to get in contact
with IF i could.
 
I have a firewall up and running BUT my boss is wanting me to block Instant
Messaging... I have worked out HOW to do this however the system that I had
working was causing problems with the email (i was using Guarddog for KDE) 

So i have resorted to handwriting everything as I should probably have done
before hand.

I was hoping that you would be able to help me out... I am limited by what I
can do to the network because this is a "stable" network (even though they
did not have a firewall before I cam 3 weeks ago) 

I have installed a Proxy server on the same box as the firewall and the
rules successfully prevent clients from accessing yahoo and msn (which a
normal firewall wouldnt because they would go through on port 80 etc)

BUT when guarddog was used it was stuffing up the IPtables.. (eg i would
open Port 80 and it would close it)

EXACTLY WHAT I NEED
------------------------------------

I need to have two sections to the firewall.. one being the server and
priviledged machine (kind of like DMZ BUT on the same ip range as the
clients much to my disgust) 

Local Clients are from 192.168.1.11-192.168.1.249 (not my setup)

I want any machines that are not included in this to NOT have to go through
the Firewall if possible. If not all of them I need the mail server
(residing on 192.168.1.251) to not be if possible.

I would like the following ports FORWARDED to 192.168.1.251
25 80 110 443
that way the squid will do the rules to filter out bad ports etc (right?)

I would like all machines that are clients to be Automatically FORWARDED to
port 3128 so that the rules can stpo the chatting etc

I have given links my "attempt" at this but am really stuck on it.. I
realise you have probably got better things to spend your time with but I
would be eternally grateful. this would take me HOURS but probably take you
minutes. I hope to hear from you soon

http://web.igateway.com.au/~chrislive/iptables/fw.leadside
http://web.igateway.com.au/~chrislive/iptables/fw_leadingside


Thankyou



