From: Gerry Reno <greno@verizon.net>
Subject: fwknop: use with Fedora?
Date: Sat, 22 Sep 2007 21:29:05 -0400
Message-ID: <46F5C161.7090908@verizon.net>
References: <46F5B7F8.2060502@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F5B7F8.2060502@verizon.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Gerry Reno wrote:
> I installed fwknop and have it configured and ready to start but in 
> reading documentation it looks like it is going to link to a user 
> chain it creates from INPUT.  I'm using Fedora 7 and there already 
> appears to be a user chain, RH-Firewall-1-INPUT, in INPUT put there by 
> Fedora.  So is this going to mess things up with fwknop?  Does anyone 
> have fwknop working with Fedora?  How do you get it to work with an 
> existing user chain?
>
> ????
>
> Gerry
>
Well, I'm just forging ahead.  Hopefully someone can answer my original 
question about user chains.

Right now I tried starting the fwknop daemon and was greeted with these 
errors:

# service fwknop start
Starting the fwknop daemons: Can't load 
'/usr/lib/fwknop/i386-linux-thread-multi/auto/Net/Pcap/Pcap.so' for 
module Net::Pcap: libpcap.so.0.9.4: cannot open shared object file: No 
such file or directory at 
/usr/lib/perl5/5.8.8/i386-linux-thread-multi/DynaLoader.pm line 230.
 at /usr/sbin/fwknopd line 47
Compilation failed in require at /usr/sbin/fwknopd line 47.
BEGIN failed--compilation aborted at /usr/sbin/fwknopd line 47.


What I have installed is the latest rpm from CipherDyne:  
fwknop-1.8.2-1.i386.rpm 
<http://www.cipherdyne.org/fwknop/download/fwknop-1.8.2-1.i386.rpm> and 
I guess this rpm either doesn't have the right dependencies and did not 
perform something necessary during %post.

help...

Gerry




