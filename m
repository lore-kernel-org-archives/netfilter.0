From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: tcp packets on 25 port FORWARDING
Date: Fri, 12 Mar 2004 10:21:45 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403121021.45434.Antony@Soft-Solutions.co.uk>
References: <DIIE.000000F500002A22@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DIIE.000000F500002A22@sbgit.com>
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

On Friday 12 March 2004 10:03 am, peter.gehle@sbgit.com wrote:

> Try this:
>
> LAN_IP=$(ifconfig eth1|head -n 2|tail -n 1|cut -d: -f2|cut -d" " -f1)

A simpler version is `ifconfig eth1|grep inet|tr -s ': ' '\t'|cut -f4`

> iptables -t nat -A PREROUTING -i *EXT-NIC* -p tcp --dport 25 -j DNAT
> --to_destination *POSTFIX-IP*

> iptables -t nat -A POSTROUTING -o *INT-NIC* -p tcp --dport 25 -j SNAT
> --to-source $LAN_IP

Why include this rule?   It will make all email received by the Postfix 
machine appear to come from the Firewall, not the real IP address of the 
sending server.   This will make anti-spam measures more difficult / less 
effective.

> iptables -A FORWARD -i *EXT-NIC* -m state --state NEW -p tcp -d *POSTFIX-IP*
> --dport 25 -j ACCEPT

What about NEW packets from inside to outside (eg delivering mail to the 
Internet?)

Also don't forget that a mail server is likely to want to do things like DNS 
lookups.

Regards,

Antony.

-- 
Having been asked for a reference for this man,
I can confirm that you will be very lucky indeed if you can get him to work 
for you.

                                                     Please reply to the list;
                                                           please don't CC me.


