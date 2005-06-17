From: Jason Opperisano <opie@817west.com>
Subject: Re: Is there a way to know a related packet is link with an ftp
	connexion ?
Date: Fri, 17 Jun 2005 10:42:09 -0400
Message-ID: <20050617144209.GA31682@bender.817west.com>
References: <42B2883B.8050004@ensg.ign.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42B2883B.8050004@ensg.ign.fr>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Jun 17, 2005 at 10:22:19AM +0200, Edouard GAULUE wrote:
> In oder to make a special logging related to ftp connexion opening...
> 
> Thanks for your answers,

to match a packet marked RELATED by the ftp conntrack helper:

  ... -m helper --helper ftp -m state --state RELATED ...

-j

--
"Stewie: Oh, I hate it when your mother worries. She usually says
 things like "I told you so" and "Stop doing that, I'm asleep.""
        --Family Guy

