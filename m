From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Port Forwarding
Date: Wed, 3 Dec 2003 08:27:54 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031204000850.06DB1474B@absolom.libra.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Remus' <rmocius@auste.elnet.lt>, netfilter@lists.netfilter.org

A method that works well for me, and I use it extensively, is to place all
your IP addresses in a text file, and feed the file to the script.  With
this method, all you need to do is update (edit) the text file as needed for
adding or deleting IP's.  For instance, if you wanted to sneak TFTP through
the firewall (which I don't really recommend), you could add this rule:

####################################################################
# TFTP
####################################################################
# if TFTP enabled redirect to port 69 on internal TFTP server
if [ "$TFTP_SERVER" = "1" ] ;
then
	while read TRUSTED;
	do
		$IPT -t nat -A PREROUTING -p udp -s $TRUSTED
--destination-port 69 -i $FW_INET_IFACE -j LOG --log-level $LOG_LEVEL
--log-prefix "DNAT IN TFTP OK: "
		$IPT -t nat -A PREROUTING -p udp -s $TRUSTED
--destination-port 69 -i $FW_INET_IFACE -j DNAT --to-destination
$INTERNAL_TFTP:69
	done < $TRUSTED_LIST
fi

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Remus
Sent: Wednesday, December 03, 2003 12:27 AM
To: netfilter@lists.netfilter.org
Subject: Port Forwarding 

Hi folks,

I have a PREROUTING rule:
iptables -t nat -A PREROUTING -d $EXTERNALIP_1 -s some_external_IP -p 47 -j
DNAT --to 192.168.0.19

How to add more source addresses which will be able to connect?


Thanks in advance

Remus





