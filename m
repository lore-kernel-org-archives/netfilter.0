From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: mixing static and dynamic mappings
Date: Sat, 8 Jun 2002 11:31:42 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206081031.g58AViA02721@Networker.rockstone.co.uk>
References: <a7d60cd.60cda7d@wechsler.com> <200206080939.g589djA32218@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206080939.g589djA32218@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Saturday 08 June 2002 10:39 am, Antony Stone wrote:

> iptables -A POSTROUTING -t nat -s server1 -j SNAT --to ext1
> iptables -A POSTROUTING -t nat -s server2 -j SNAT --to ext2
> iptables -A POSTROUTING -t nat -s server3 -j SNAT --to ext3
> iptables -A POSTROUTING -t nat -j SNAT ext4
>
> will map anything which isn't server1, server2 or server3 onto ext4

Ooops !   Sorry - I got that last line wrong - it should still specify that 
the source address is somewhere in your internal range, otherwise it'll just 
SNAT everything !!!

This is the correct example:

iptables -A POSTROUTING -t nat -s 192.168.1.10 -j SNAT --to ext1IP
iptables -A POSTROUTING -t nat -s 192.168.1.16 -j SNAT --to ext2IP
iptables -A POSTROUTING -t nat -s 192.168.1.55 -j SNAT --to ext3IP
iptables -A POSTROUTING -t nat -s 192.168.1.0/24 -j SNAT --to ext4IP



Antony.

