From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: -m helper --helper -irc
Date: Tue, 17 Aug 2004 14:35:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41225DFF.3060801@pbl.ca>
References: <51382563.20040817200441@op.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <51382563.20040817200441@op.pl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Marcin Sura wrote:
> Hi
> 
>   I use following rule for marking irc dcc transfers from my NATed lan.
> 
>   iptables -t mangle -A PREROUTING -p tcp -m helper --helper irc \
>   -m mark --mark 0 -j MARK --set-mark 1
> 
>   And this works perfectly when I send a file to somebody, and doesn't
>   when somebody sends something to me. Why?

Not quite sure what you are trying to achieve with above rule.  And hard 
to say what you are doing without looking at the rest of your rules 
(what are those marks used for???).  Why did you need mangle table if 
all you have is simple NATed LAN?

Haven't used irc module, however, taking analogy with ftp module, I 
would probably try something like this (modify to match your network 
configuration):

# I doubt this one is loaded automatically
modprobe ip_nat_irc

# Let assume you implemented masquerading something like this,
# like most people do...
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# IRC is 6666?  Or was it 6667?  Or was it port range?
# Modify as needed...
iptables -A FORWARD -p tcp --sport 1024: --dport 6666 \
    -s 192.168.0.0/16 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A FORWARD -p tcp --sport 6666 --dport 1024: \
    -d 192.168.0.0/16 -m state --state ESTABLISHED -j ACCEPT

# DCC.  This works for FTP, I would guess IRC DCC should be the same
iptables -A FORWARD -p tcp --sport 1024: --dport 1024: \
    -m helper --helper irc \
    -m state --state RELATED,ESTABLISHED -j ACCEPT

I assumed that all DCCs are from high ports to high ports (like passive 
FTP data connection).  This example isn't particulary strict.  You may 
make it tighter as needed.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

