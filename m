From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: iptables-save file syntax
Date: Thu, 10 Oct 2002 19:46:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007001c27085$0170b4c0$026410ac@honor>
References: <719A38AB7279D511B91900D0B7444A9E01EF58BB@caemsx03.cae.ca>
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
To: Nicolas Cadilhac <cadilhac@cae.com>, netfilter@lists.netfilter.org

From: "Nicolas Cadilhac" <cadilhac@cae.com>

> I wonder what are those numbers on these lines :
>
> *nat
> :PREROUTING ACCEPT [77070:3730176]
> :POSTROUTING ACCEPT [2859:369253]
> :OUTPUT ACCEPT [6476:595842]
>
> sometimes it's 0:0 but since they are really big numbers they are not
ports.
> Also are these lines policies ?

its the number of packets/bytes of the table and its the default policy..

if you do an iptables -L -v you would see the same stuff as table headers
for each chain.



