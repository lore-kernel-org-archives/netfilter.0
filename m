From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables and samba
Date: Thu, 27 May 2004 17:00:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405271700.29040.Antony@Soft-Solutions.co.uk>
References: <BAY15-F10BvW8XADQQW000127bc@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F10BvW8XADQQW000127bc@hotmail.com>
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

On Thursday 27 May 2004 4:40 pm, azeem ahmad wrote:

> >hi
> >
> >i have two shares on samba server "Soft and linux" in these shares there
> >are many folders. whenever i run the above script and then i open the
> > share it takes atleast 4  minutes to open the share. but it doesnt take
> > time while browsing inside share.
> >mean there is a folder on soft share like soft/adobe/acrobat/acrobat6
> >when i double click on soft it takes atleast 4 minutes but after that when
> >i click on adobe then acrobat then acrobat6 it takes now time it just
> > brose them normally. same problem is with the other share named linux.
> >but if i dont run this script then all shares work fine with no delay
> >
> >i m using the script below
> >
> > iptables -F
> >iptables -t nat -F
> >iptables -P INPUT DROP
> >iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> >iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
> >iptables -A INPUT -i eth0 -p tcp --dport 22   -j ACCEPT
> >iptables -A INPUT -i eth0 -p tcp --dport 53   -j ACCEPT
> >iptables -A INPUT -i eth0 -p udp --dport 53   -j ACCEPT
> >iptables -A INPUT -i eth0 -p udp --dport 137  -j ACCEPT
> >iptables -A INPUT -i eth0 -p udp --dport 138  -j ACCEPT
> >iptables -A INPUT -i eth0 -p tcp --dport 139  -j ACCEPT

I think you should check the above three services - I'm not sure you have TCP 
& UDP correctly associated with the port numbers (I thought the two odd ones 
were one protocol, and 138 was the other protocol, but which way round I 
don't recall).

Also, add a LOG rule at the end of the ruleset so you can see any other 
packets which are trying to get in, but are getting DROPped by the default 
policy - if, as you say, the problem doesn't occur when you don't run the 
ruleset, there must be something being DROPped which would solve the problem 
if you ACCEPTed it.

> >i dont know what is the udp port 80 for but i just saw its traffic on my
> >network in iptraf so i included it in my script

That doesn't like a secure reason to allow it to me - and I have no idea what 
could be using UDP port 80 - I think you should investigate further rather 
than just assume it's desirable.

Regards,

Antony.

-- 
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the list;
                                                           please don't CC me.


