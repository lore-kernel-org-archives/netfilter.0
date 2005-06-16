From: "Carl Holtje ;021;vcsg6;" <cwh0803@cs.rit.edu>
Subject: Re: multiport
Date: Thu, 16 Jun 2005 10:17:01 -0400 (EDT)
Message-ID: <Pine.GSO.4.58.0506161013200.26426@queeg.cs.rit.edu>
References: <1118930391.16084.2.camel@debianbox>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1118930391.16084.2.camel@debianbox>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Sadus ." <sadus@swiftbin.net>
Cc: netfilter@lists.netfilter.org

On Thu, 16 Jun 2005, Sadus . wrote:

> Hello i want to drop ALL connections on my internal NIC except:
> 20,21,80,443
> is this correct? (although not working)
>
>
> iptables -A INPUT -i eth1 -s 172.16.3.0/16 -p tcp -m multiport !
> --destination-port  20,21,80,443 -j DROP #USERS

iptables -P INPUT DROP
iptables -A INPUT -i eth1 -s 172.16.3.0/16 -p tcp -m multiport \
--destination-port  20,21,80,443 -j ALLOW

Which does what your english description says.. drops all by default, but
allows ports 20, 21, 80, 443 to your 172.16.3.0/16 network, over eth1.

Carl

- --

"There are 10 types of people in the world: Those who understand binary
and those that don't."


