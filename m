From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: No chain target match by that name
Date: Thu, 5 Jan 2006 08:45:54 +0100
Message-ID: <004b01c611cc$0ed3cd00$0101000a@sterenborg.info>
References: <d23987670601042238k54f2937fkbe26ed5c564a39a2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d23987670601042238k54f2937fkbe26ed5c564a39a2@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Sorry, i already have iprange patch installed.
> But It is getting error.

Did you compile iprange as a module and load it ? (lsmod)

Do you have the RETURN target ?
iptables -j RETURN --help
Last 2 lines :
Standard v1.3.x options:
(If target is DROP, ACCEPT, RETURN or nothing)


Gr,
Rob


> On 1/5/06, vikrant <vikrant@saysnetsoft.com> wrote:
>> Tharindu Rukshan Bamunuarachchi wrote:
>> 
>>> netfilter@lists.netfilter.org
>>> 
>>> hi all,
>>> when i tried to add following rule,
>>> 
>>> $IPTABLES -t nat -N Proxy
>>> 
>>> $IPTABLES -t nat -A Proxy -m iprange --dst-range
>>> 100.298.10.9-100.298.10.40 -j RETURN
>>> 
>>> i got following error,
>>> 
>>> iptables: No chain/target/match by that name
>>> 
>>> Please comment,
>>> 
>>> iptable version is 1.2.11
>>> kernel version is 2.4.29-lug
>>> 
>>> Regards
>>> --
>>> Tharindu Rukshan Bamunuarachchi
>>> all fabrications are subject to decay
>>> 
>>> 
>>> 
>>> 
>>> 
>> U need to apply patch for iprange module .Check the following link:-
>> 
> _http://www.netfilter.org/projects/patch-o-matic/pom-base.html
> #pom-base-iprange_ 


