From: Martin Ferrari - Decidir IT <mferrari@decidir.net>
Subject: RE: IP-Range and Subnetmask
Date: Thu, 6 Nov 2003 08:18:35 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0EF8394892B74144ACF999556D1FD6BB7DE51D@dexter.decidir.net>
Reply-To: mferrari@decidir.net
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Use the CIDR notation:

172.16.0.0/12

ex.: iptables -A INPUT -p tcp -s 172.16.0.0/12 -d $INET_IP -i ppp0 -j
SPOOFED

> From: Bewerbungsadresse@web.de [mailto:bewerbungsadresse@web.de]
> Sent: Wednesday, November 05, 2003 6:21 PM

> is it possible to prevent spoofing attacks to 
> 172.16.0.0-172.31.255.255 
> on the external internet IP in one rule?
> 
> something like that
> 
> iptables -A INPUT -p tcp -s 172.16.0.0/255.31.0.0 -d $INET_IP 
> -i ppp0 -j 
> SPOOFED

This was wrong, as the netmask should have been 255.240.0.0; the former
netmask was invalid.


