From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Urgent: Please help me about block port 80
Date: Fri, 21 May 2004 09:35:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40AE13BB.2060701@pbl.ca>
References: <40AC6EA8.69A94AF4@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40AC6EA8.69A94AF4@hotmail.com>
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
To: Patrick <boysdk@hotmail.com>
Cc: netfilter@lists.netfilter.org

Patrick wrote:
> Dear sir/madam,
> 
> My goal is to allow only one IP(192.168.1.10) to access my server via
> port 80 or 8080 and forward all request from port 80 to port 8080.
> 
> What I do is as below.
> 
> *nat
> :PREROUTING ACCEPT [1:48]
> :POSTROUTING ACCEPT [3:230]
> :OUTPUT ACCEPT [3:230]
> -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
> COMMIT
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> :RH-Lokkit-0-50-INPUT - [0:0]
> -A INPUT -j RH-Lokkit-0-50-INPUT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp -s 192.168.1.10/255.255.255.255
> --dport 8080 --syn -j ACCEPT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp -s 192.168.1.10/255.255.255.255
> --dport 80 --syn -j ACCEPT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 0:1023 --syn -j REJECT
> COMMIT
> 
> It seems that the port 80 and 8080 open to public after I add prerouting
> rule.  Would you mind how I could acheive my goal?  Thanks a lot.

Ditch the lokkit.  It is intended for *very* basic firewall 
configuration.  What you want to do is rather simple, however it is 
above the "basic" level of usage lokkit is intended for.  Mixing lokkit 
with hand-made configuration can screw things (or overwrite your 
configuration, I believe it inserts a comment in the file along the 
lines "do not hand edit").  Just remove everything with RH-Lokkit in it, 
and don't use lokkit utility.

In filter table, I'd probably change policy for all three builtin chains 
(INPUT, FORWARD, OUTPUT) to DROP.  And than I'd insert the rules to 
allow only traffic that I want to allow.  That way, anything that isn't 
explicitly allowed is droped.  Which is (IMHO) better approach than 
patching the gaping holes.  For example, this might be one way to 
rewrite filter table:

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]

# This will handle returning packets, etc
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# To allow unrestricted access from this machine uncomment line bellow
# or add more explicit rules to OUTPUT chain if you want to control
# what you allow to go out
# -A OUTPUT -m state --state NEW -j ACCEPT

# Now, allow only 80 and 8080 for 192.168.1.10
-A INPUT -s 192.168.1.10 -p tcp --dport 80 -m state --state NEW -j ACCEPT
-A INPUT -s 192.168.1.10 -p tcp --dport 8080 -m state --state NEW -j ACCEPT

Note that above is just an idea.  I'm not using anything similar to this 
(other than having default policies set to DROP), nor have I tested it. 
  So you might have to do some adjustments.  I just typed this, so there 
might be a typo or two (should be easy to catch ;-) ).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

