From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: RE: documentation netfilter
Date: Wed, 14 Sep 2005 08:22:11 -0400
Message-ID: <1126700531.2651.8.camel@localhost>
References: <24026302.1126689606287.JavaMail.www@wwinf4002>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <24026302.1126689606287.JavaMail.www@wwinf4002>
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
To: kossentini_3@voila.fr
Cc: netfilter@lists.netfilter.org

On Wed, 2005-09-14 at 11:20 +0200, kossentini_3@voila.fr wrote:
> hello,
>  Within the framework of my project of end of study, I must choose best the firewall open source and then I must develop new functionalities so that it is same level as check point or another owner firewall (for example cisco Centri Firewall...). 
>  
> can you help me in this subject? which is the best  firewall open source (if there is one of the bonds towards site, a study)...? 
> thank you in advance 
<snip>
From everything I have seen, iptables combined with other open source
projects such as iproute2 and {open,strong}swan is far superior to
CheckPoint and most other commercial firewalls.  In fact, it amazes me
that no one has commercially exploited this yet with significant
success.  Even some of the more successful linux based solutions are
using fairly old technology.

iptables not only excels in functionality but in flexibility.

The main disadvantage I have found is the dearth of enterprise/carrier
grade management tools.  One can do more with iptables than one can do
with Checkpoint if one administers one firewall at a time (or several).
For smaller environments, it is better than learning a complex user
interface.  But there is nothing akin to Provider1, Solsoft or
SmartPipes for very large deployments of hundreds and thousands of
firewalls with thousands to hundreds of thousands of users with highly
complex security.

Although one can make iptables do far more than Checkpoint in such
scenarios, the manpower cost of managing such an installation with open
source tools is prohibitive.

That is why we have been working on the ISCS project
(http://iscs.sourceforge.net). This project exceeds the capabilities of
tools like Provider1, Solsoft and SmartPipes yet is entirely open source
and works with open source products like iptables, iproute2 and *swan.
Unfortunately, I've been mostly pulled off the project for the last year
+.  If anyone would like to jump in and help so we can fill this missing
gap and make open source firewalls a superior choice to commercial
products on all fronts - not just functionality and flexibility but
management, too, please let me know - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


