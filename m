From: <alexis@tpys.com.ar>
Subject: RE: iptables and samba
Date: Thu, 27 May 2004 16:28:35 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <twig.1085675315.20438@baicom.com>
References: <BAY15-F10BvW8XADQQW000127bc@hotmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: azeem ahmad <azeem484@hotmail.com>
Cc: netfilter@lists.netfilter.org

it seems a name resolution issue.

check if you're using WINS or DNS and make sure you're allowing those ports 
in orden to resolve the names. and it will work just fine

azeem ahmad <azeem484@hotmail.com> dijo:

> 
> no one out there could help me?
> 
> >From: "azeem ahmad" <azeem484@hotmail.com>
> >To: netfilter@lists.netfilter.org
> >Subject: iptables and samba
> >Date: Sun, 23 May 2004 09:20:52 +0000
> >
> >hi
> >i m using the script below
> >---------------------------------------------------------------------------
----------------------------------------------------------
> >iptables -F
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
> >
> >iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
> >#iptables -t nat -A PREROUTING -p udp --dport 80 -j REDIRECT --to-port 8080
> >
> >iptables -P FORWARD DROP
> >iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> >iptables -A FORWARD -i eth0 -p tcp --dport 21        -j ACCEPT
> >iptables -A FORWARD -i eth0 -p tcp --dport 443       -j ACCEPT
> >iptables -A FORWARD -i eth0 -p tcp --dport 5000      -j ACCEPT
> >iptables -A FORWARD -i eth0 -p tcp --dport 5001      -j ACCEPT
> >iptables -A FORWARD -i eth0 -p tcp --dport 5005      -j ACCEPT
> >iptables -A FORWARD -i eth0 -p tcp --dport 5050      -j ACCEPT
> >iptables -A FORWARD -i eth0 -p tcp --dport 6660:6670 -j ACCEPT
> >iptables -A FORWARD -i eth0 -p tcp --dport 7000      -j ACCEPT
> >iptables -A FORWARD -i eth0 -p tcp --dport 28805     -j ACCEPT
> >iptables -A FORWARD -i eth0 -p tcp --dport 51215     -j ACCEPT
> >
> >iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> >---------------------------------------------------------------------------
----------------------------------------------------------
> >
> >i have two shares on samba server "Soft and linux" in these shares there 
> >are many folders. whenever i run the above script and then i open the 
share 
> >it takes atleast 4  minutes to open the share. but it doesnt take time 
> >while browsing inside share.
> >mean there is a folder on soft share like soft/adobe/acrobat/acrobat6
> >when i double click on soft it takes atleast 4 minutes but after that when 
> >i click on adobe then acrobat then acrobat6 it takes now time it just 
brose 
> >them normally. same problem is with the other share named linux.
> >but if i dont run this script then all shares work fine with no delay
> >
> >i dont know what is the udp port 80 for but i just saw its traffic on my 
> >network in iptraf so i included it in my script
> >
> >Regards
> >Azeem
> >
> >_________________________________________________________________
> >Add photos to your e-mail with MSN 8. Get 2 months FREE*. 
> >http://join.msn.com/?page=features/featuredemail
> >
> >
> 
> _________________________________________________________________
> The new MSN 8: smart spam protection and 2 months FREE*  
> http://join.msn.com/?page=features/junkmail
> 
> 
> 



-- 




