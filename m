From: "Rodrigo Montoro" <spooker@gmail.com>
Subject: Re: Transparent proxy errors
Date: Fri, 9 Jun 2006 09:07:14 -0300
Message-ID: <9255886c0606090507w7980d50es9d08edd12c89ee8f@mail.gmail.com>
References: <44365.10.137.2.111.1149854383.squirrel@mail.medcol.mw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44365.10.137.2.111.1149854383.squirrel@mail.medcol.mw>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "isaiah@medcol.mw" <isaiah@medcol.mw>
Cc: netfilter@lists.netfilter.org

   You can't use transparent proxy with SSL cause headers are
encrypted and contains no useful data about destinations.

Regards,

On 6/9/06, isaiah@medcol.mw <isaiah@medcol.mw> wrote:
> Dear all,
>
> I have a box setup for transparent proxying. Since this happened I have
> had several websites timing out.
>
> I have what seems like an SSL problem with many websites especially
> hotmail. When one wants to log onto hotmail, the proxy gives "document
> contains no data reply". When I manually configure the proxy in my
> browser, I then can logon with no problems.
>
> Could anyone help me resolve this?
>
> Regards,
>
> Isaiah.
>
>


-- 
=====================
 Rodrigo Ribeiro Montoro
Desenvolvedor BRMAlinux
  spooker@brc.com.br
       RHCE/LPIC-I
=====================

