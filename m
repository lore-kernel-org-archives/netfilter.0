From: "Sebastian" <netfilter@basti79.de>
Subject: RE: Deleting Rules
Date: Sun, 14 Sep 2003 15:10:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c37ac1$9719e7c0$fe78a8c0@basti79>
References: <3F642E1B.8010801@riovia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F642E1B.8010801@riovia.net>
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
To: 'Paul Caritj' <pcaritj@riovia.net>, Netfilter Mailinglist <netfilter@lists.netfilter.org>

Hi

Try around with something like this:
iptables -L INPUT -n --line-numbers | \
awk -- '{ if ($5=="192.168.0.1") { iptables -D INPUT $1 } }'

This will delete all entries in INPUT chain with source IP (column 5) of
192.168.0.1
Pearhaps you have to optimize some things to fit your needs.

Greets
Sebastian.


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Paul Caritj
> Sent: Sunday, September 14, 2003 11:00 AM
> To: netfilter@lists.netfilter.org
> Subject: Deleting Rules
> 
> 
> Simple Question:
> 
> Is it possible to delete rules without complete knowledge of its 
> contents? E.g., Would it be possible to delete all rules that match a 
> source ip of X?
> 
> If not, can anyone reccomend a workaround? I am creating rules on the 
> fly and setting them to mark packets with a flag that would not be 
> knowable subsequently. (Rather, unknowable unless there is no 
> solution 
> to this problem and I am forced to keep some sort of log...eew)
> 
> 
> Thanks,
> Paul
> 
> 
> 


