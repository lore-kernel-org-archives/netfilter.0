From: Bob Sully <rcs@malibyte.net>
Subject: Re: Dynamic Deny rule
Date: Sat, 4 Jan 2003 10:53:16 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0301041051010.25229-100000@firefox.malibyte.net>
References: <000101c2b405$a39f7dd0$0501a8c0@underworld>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c2b405$a39f7dd0$0501a8c0@underworld>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Ryan <markryan@cfl.rr.com>
Cc: netfilter@lists.netfilter.org


Mark:

Here's the excerpt from my script:

  # Refuse any connections to/from problem sites.
  #
  # /etc/firewall/firewall.banned contains a list of IPs
  # to block all access, both inbound and outbound.
  # The file should contain IP addresses with CIDR
  # netmask, one per line:
  #
  # NOTE: No comments are allowed in the file.
  #
  # 111.222.333.444/32            - To block a single IP address
  # 111.222.333.444/8             - To block a Class-A network
  # 111.222.333.444/16            - To block a Class-B network
  # 111.222.333.444/24            - To block a Class-C network
  #
  # The CIDR netmask number describes the number of bits
  # in the network portion of the address, and may be on
  # any boundary.
  #

  if [ -f /etc/firewall/firewall.banned ]; then
     while read BANNED; do
         iptables -A INPUT -i $EXTERNAL_INTERFACE -s $BANNED -j DROP
         iptables -A INPUT -i $EXTERNAL_INTERFACE -d $BANNED -j DROP
         iptables -A OUTPUT -o $EXTERNAL_INTERFACE -s $BANNED -j DROP
         iptables -A OUTPUT -o $EXTERNAL_INTERFACE -d $BANNED -j DROP
     done < /etc/firewall/firewall.banned
  fi

HTH...Bob


On Sat, 4 Jan 2003, Mark Ryan wrote:

> I am trying to come up with a iptables rule that will deny ip certain ip
> addresses that I can load/unload into a file.
>  
> To clarify...i run a ftp server and sometimes people screw around and I
> want to ban them from logging in.  I need a way to add these ip's into a
> 'ban list'.  I don't want to add a new rule every time however with a
> separate rule for each ip.
>  
> Is there a way to make a file such as 'banned_ips' and have a rule look
> into that file to decide if the ip can log in or not?
>  
> Thanks,
> Mark


-- 
________________________________________
Bob Sully - Simi Valley, California, USA
http://www.malibyte.net

"The waiting is the hardest part." - T. Petty



