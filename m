From: Frank Petran <frank.petran@inpho.de>
Subject: Re: How to filter packets resulting from hosts with dynamic
	IP-address
Date: Tue, 6 Feb 2007 17:07:21 +0100
Message-ID: <200702061707.22039.frank.petran@inpho.de>
References: <200702061042.21497.frank.petran@inpho.de>
	<slrnesh7qv.82c.xpisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <slrnesh7qv.82c.xpisar@album.ics.muni.cz>
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

On Tuesday 06 February 2007 16:31, Petr Pisar wrote:
> As you can see, relaing on IP address is not secure. You should consider
> using some type of authentication (e.g. IPsec).
Yes, you are perfectly right. But authetication is only one part of the 
solution. I have pretty bad experience with an open ssh port, although no one 
has managed so far to break in, considerable amount of traffic was generated 
on my connection trying to brute force their way in almost resulting in a 
DOS. Preselecting who I would like to allow access, will reduce those attacs 
to virtually zero.

Frank
-- 
INPHO GmbH   *   Smaragdweg 1   *   70174 Stuttgart   *   Germany
phone: +49 711 2288 10  *  fax: +49 711 2288 111  *  web: www.inpho.de
place of business: Stuttgart    *   managing director: Johannes Saile
commercial register: Stuttgart, HRB 9586


