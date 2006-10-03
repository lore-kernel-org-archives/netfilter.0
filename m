From: angico <angico@yahoo.com>
Subject: Re: Cant find
Date: Tue, 3 Oct 2006 05:36:39 -0700 (PDT)
Message-ID: <20061003123639.47431.qmail@web36810.mail.mud.yahoo.com>
References: <009701c6e643$7f20ef60$4401a8c0@WINXPVIRUSMONITOR>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <009701c6e643$7f20ef60$4401a8c0@WINXPVIRUSMONITOR>
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

Try upgrading iptables.
regards,
angico.


--- Joel Lindsay <joel@waveteq.com> wrote:

> Keep getting the error.
> 
> iptables v1.2.11: Couldn't find target `MASQUERADE'
> 
> Using kernel 2.6.15-uc0 uclinux.
> 
> Have compiled as module and statically the following.
> 
> iptables support
> connection tracking support
> ip filter support
> reject target support
> full nat support
> masquerading support
> 
> the module ipt_MASQUERADE exists and is loaded, but I keep getting
> this 
> error.  I cant figure out why??
> 
> Is there more dependencies on some other modules?
> 
> 
> Joel Lindsay, B.Eng
> Project Engineer
> Waveteq Communications
> (250) 766-9229
> ----- Original Message ----- 
> From: "Stefan Friedel" <stefan.friedel@iwr.uni-heidelberg.de>
> To: "Pascal Hambourg" <pascal.mail@plouf.fr.eu.org>
> Cc: <netfilter@lists.netfilter.org>
> Sent: Monday, October 02, 2006 7:18 AM
> Subject: Re: DNAT problem
> 
> 
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

