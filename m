From: "Moti Levy" <moti@flncs.com>
Subject: Re: PC Anywhere through firewall
Date: Thu, 12 Feb 2004 15:47:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01ed01c3f1a9$6facf9c0$7c0b070a@FTLLDIMITRIM01>
References: <OFD362AE1B.2551EEFC-ON85256E38.006CA759-85256E38.006CE218@mcleodhealth.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Chris Baker <cbaker@bbbscentralohio.org>
Cc: netfilter@lists.netfilter.org

   iptables -t nat -A PREROUTING -p tcp -d $IP  \
               --destination-port  5631 -j  DNAT --to $IP_INTERNAL
   iptables -t nat -A PREROUTING -p udp  -d $IP  \
               --destination-port  5632 -j  DNAT --to $IP_INTERNAL




----- Original Message ----- 
From: <DCulp@mcleodhealth.org>
To: "Chris Baker" <cbaker@bbbscentralohio.org>
Cc: <netfilter@lists.netfilter.org>; <netfilter-admin@lists.netfilter.org>
Sent: Thursday, February 12, 2004 2:49 PM
Subject: Re: PC Anywhere through firewall


>
>
>
>
> Verify you have the needed Ports Open:
>       Status      UDP   5632
>       Data  TCP   5631
>
> David
>
>
>
>
>              "Chris Baker"
>              <cbaker@bbbscentr
>              alohio.org>                                                To
>              Sent by:                  <netfilter@lists.netfilter.org>
>              netfilter-admin@l                                          cc
>              ists.netfilter.or
>              g                                                     Subject
>                                        PC Anywhere through firewall
>
>              02/12/04 02:05 PM
>
>
>
>
>
>
>
>
> Does anyone have an idea on how to route PC Anywhere through a firewall. I
> have set up the ports in the firewall to do DNAT to the IP address. Is
that
> right? Or should I set it up to REDIRECT?
>
> Chris
>
> Register your team online today!
> BOWL FOR KIDS'SAKE 2004
> Saturday, March 6, 2004
> www.bfkscentralohio.org
> You'll be "bowled over" when our brochure "strikes" your mailbox at the
end
> of January.sorry.we couldn't help ourselves! If you do not receive one,
> please contact me!
>
> ==============================================================
> Chris Baker -- technical specialist
> 614-839-2447x108 -- cbaker@bbbscentralohio.org
> www.bbbscentralohio.org -- Big Brothers Big Sisters of Central Ohio
> Opinions expressed in this e-mail are solely my own.
>
> The document(s) accompanying or within this email transmission may contain
> confidential information belonging to Big Brothers Big Sisters of Central
> Ohio, which is legally privileged for the entity named above.  If you are
> not the intended recipient, you are hereby cautioned that any disclosure,
> copying, distribution, or the taking of any action in reliance on the
> contents of this email information is strictly prohibited.  If you receive
> this email in error, please notify us immediately by fax (614-839-5437) or
> phone (614-839-2447) to advise of the error.
>
>
>
>
>
>
>


