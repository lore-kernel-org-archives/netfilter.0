From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: firewalled dns clients
Date: Thu, 6 Nov 2003 23:46:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311062346.10648.Alistair@nerdnet.ca>
References: <F22386C3FEB012449238672E38ED61E706C26A@overlord.overturemedia.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E706C26A@overlord.overturemedia.com>
Content-Disposition: inline
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
To: Fritz Mesedilla <fritz.mesedilla@overturemedia.com>, "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>

On November 6, 2003 10:49 pm, Fritz Mesedilla wrote:
> Greetings!
> Thank to all of your help I was able to create a safe network behind an
> iptables firewall. Now I need help again.
> How do I let the workstations do a nslookup?
>
>           Internet
>
>
>           Firewall
>
>
>     -------------------------------
>
>
> workstation    workstation    workstation
>
>
>
>
> From their windows workstation, I want to be able to let them perform a
> nslookup.
>
> I tried this and nothing happened.
> $IPTABLES -A INPUT -p tcp --sport 53 -j ACCEPT
> even a
> $IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT
>
> Do I need a nat?
>
	You may need to include upd port 53 access for the clients.
	is your DNS server on the iptables firewall box? 
	if not the above rules aren't gonna help.
	you need to allow 53 to the DNS server -- if you are using external DNS you 
need to allow the ports through the FORWARD chain.
>
> Cheers,
>
>
> fritz <www.mesedilla.com>
> ---
> + Basta Ikaw Lord
>
>
> ----------------------------------------------------------------------
> This email and any files transmitted with it are confidential and
> intended solely for the use of the individual or entity to whom they
> are addressed. If you have received this email in error please notify
> the sender immediately by e-mail and delete this e-mail from your
> system. Please note that any views or opinions presented in this
> email are solely those of the author and do not necessarily represent
> those of the company. Finally, the recipient should check this email
> and any attachments for the presence of viruses. The company accepts
> no liability for any damage caused by any virus transmitted by this
> email.
>
> Overture Media, Inc.
> Direct Line: (632) 635-4785
> Trunkline:   (632) 631-8971 Local 146
> Fax: (632) 637-2206
> Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave.,
> Quezon City 1100

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

