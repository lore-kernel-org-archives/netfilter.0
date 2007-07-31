From: Frank Petran <frank.petran@inpho.de>
Subject: Re: getting iptables into embedded kernel
Date: Tue, 31 Jul 2007 12:09:30 +0200
Message-ID: <200707311209.30984.frank.petran@inpho.de>
References: <1529899887@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1529899887@web.de>
Content-Disposition: inline
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

On Tuesday 31 July 2007 11:24, Klaus Wacker wrote:
> Yes, did that and then I try to run it but it only says "cannot execute
> binary file"
What machine were you using to compile the iptables binary?

You mentioned, your target machine is a PPC, if you compile iptables on an x86 
machine without cross compiling option for PPC, you will end up with an Intel 
binary that will not run on Power-PC architecture.

Frank
-- 
INPHO GmbH   *   Smaragdweg 1   *   70174 Stuttgart   *   Germany
phone: +49 711 2288 10  *  fax: +49 711 2288 111  *  web: www.inpho.de
place of business: Stuttgart    *   managing director: Johannes Saile
commercial register: Stuttgart, HRB 9586
Visit us at Trimble Dimensions 2007

