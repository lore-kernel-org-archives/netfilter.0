From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: having more then 1 external interfaces ?
Date: Mon, 18 Oct 2004 10:39:09 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4173E39D.5000306@pbl.ca>
References: <20041007164628.GN13901@sunbeam.de.gnumonks.org><Pine.LNX.4.61.0410180124290.11959@filer.marasystems.com>	<20041017233937.GB21927@sunbeam.de.gnumonks.org>
	<000201c4b4ae$e065e5a0$0300000a@serverxxx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000201c4b4ae$e065e5a0$0300000a@serverxxx>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Faisal <faisal@clickonlinenetworks.com>
Cc: netfilter@lists.netfilter.org

Faisal wrote:
> is it possible in iptables to have more then 1 external interfaces ?

Short answer.  Yes.

Longer answer.  Netfilter do not have notition of external or internal 
interface.  They are all the same.  You build firewall rules according 
to which interfaces you consider as internal, external, and what kind of 
traffic are you going to allow on them.  If you want, you might be just 
as restrictive on internal interfaces as on external.

If you are using some software that generates firewall rules for you, 
than that software might have limitation of allowing you to tag only one 
interface as external.  Again, this is not limitation imposed by 
Netfilter.  For Netfilter, there's no such thing as internal or external 
interface.  Netfilter knows only about "interfaces", it doesn't know 
what you consider them to be.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

