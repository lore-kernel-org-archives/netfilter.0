From: "Intercom@x" <intercomax@yahoo.com.br>
Subject: Re: "connection tracking" and "Connection state"?
Date: Wed, 2 Apr 2003 12:33:12 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d301c2f92d$2e7b9210$2700a8c0@video>
References: <F9fFM7FJ5l7rOwSbiqW0000601a@hotmail.com>
Reply-To: "Intercom@x" <intercomax@yahoo.com.br>
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

Hi all,

Is it possible to redirect any url request to another address, from an
internal nat address requesting a valid url to a internal specific address?
Something like  iptables -t nat -A PREROUTING -p tcp -d
192.168.0.0/255.255.0.0 --dport 80 -j DNAT --to-destination 192.168.5.254:80
?

Thanks.

Mauricio S. Mudrik
IT Director
Intercomax - Your Office in Transit
Cybertools - Tools for Cyber Spaces
Aeroshopping.net - The (future) Brazilian Airports Portal Services
55 11 6445-2399 / 2388 / 2622


