From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: problem with ./runme in --batch mode. -- current p-o-m
Date: Sat, 11 Jan 2003 00:38:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030111003807.276f2728.arnt@c2i.net>
References: <200301092244.09844.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301092244.09844.Alistair@nerdnet.ca>
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
To: netfilter@lists.netfilter.org

On Thu, 9 Jan 2003 22:44:09 -0500, 
Alistair Tonner <Alistair@nerdnet.ca> wrote in message 
<200301092244.09844.Alistair@nerdnet.ca>:

> 
> 	Hi folks:
> 	
> 	Its too late at night, and I shouldn't be mucking with scripts.
> 	... I realize now that my previous email was in error ... and 
> now realize what is actually happening when passing a long list to
> ./runme ... its just disconcerting to see patches that I don't want in
> the "already applied" list that ./runme spits up when running in batch
> mode ... I can now see that the $EXCLUDED are copied to $SEEN and
> listed in already applied list because of that ... 
> 
>    perhaps we could put a *bypassed* tag in there so that others don't
>    get as confused as I..... 

..on finishing a batch run, it would be nice finding 
a batch run log somewhere, to ease my confusion some, 
on what works and not.

..does anyone run p-o-m from rpmbuild at all?

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



