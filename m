From: <hard__ware@hotmail.com>
Subject: A Box got Hacked !
Date: Fri, 29 Nov 2002 16:29:44 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE24yfVAgK1uhmW4pvP000039db@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

oh no,

it was a quite moday afternoon for myself.

this was on 18th nov 2002, I was to recieve a call
asking if i could look at "Router / Firewall " running
"Red Hat Linux" , i responded with not a problem and
proceeded to ask what kind of problem this box had.
the guy told me that it had been offline for over 4 days.

after our chat i believed that his firewall had most likely been hacked /
root kitted and i was off to look at the
problem ...

when i got onsite he had the started the box for me and
all means of communications un plugged .. (good stuff)
i already had root access and proceeded to type 'ls /root'
to get the message no command found ect ect ...
so i used 'dir /root'  instead , to find a root kit had been left there and
what a huge mess the hacker had made ..

the box has been reinstalled and i found out how they got in (via Bind DNS)
, not to mention i didnt even set the box up in the first place and it was
running ipchains with
the worst set of rules ive ever seen, no wonder this e box got hacked ....

ok my problem is all logs have been distroyed from the hacker ... (we put a
new hard drive in the Firewall)
is there any other methods of catching these bastard now
that the damage has been done ??? are there Internet SPY's that keep logs of
Monitored traffic ect ???
i have been told from some that the Internet Storms -Centre can sometimes
help and they have been notified by the owner of this firewall / buisness ..

any help woukd be great

cyas ... Hard__warE

