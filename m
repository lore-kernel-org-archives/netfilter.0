From: "Seb P." <coolhand@videotron.ca>
Subject: Security Standards for a DMZ
Date: Tue, 25 Mar 2003 22:38:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E80CC6C.BD3C2AA9@videotron.ca>
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
To: Netfilter <netfilter@lists.netfilter.org>

Hi

I would like to introduce myself to security standards...

I have a 3-way firewall filtering packets for/from internet/lan/dmz

I have a few servers in the DMZ, SFTP, WEB and email...

I have a DNS and DHCP in the lan zone

Shoul I accept udp port 53 (dns) packets only for the dns server ?
Where should i implant a honeypot ? in the DMZ ?

What are the security standards for a firewall like that ?

Thanks

Eric



