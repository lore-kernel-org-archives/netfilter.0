From: "=?iso-8859-1?Q?Geffrey_Vel=E1squez?=" <g_netfilter@netfids.com>
Subject: Re: Protecting against DoS
Date: Tue, 9 Dec 2003 14:20:09 -0500 (PET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <36917.200.48.142.50.1070997609.squirrel@www.netfids.com>
References: <20031209171322.GE17221@edu.joroinen.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031209171322.GE17221@edu.joroinen.fi>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: pasik@iki.fi
Cc: mgale@utilitran.com, netfilter@lists.netfilter.org

Hum.. but what happen if the workstation is infected? the virus will do a
DoS to the user of the workstation, the firewall will block valid
connections.
> On Tue, Dec 09, 2003 at 10:06:50AM -0700, Michael Gale wrote:
>> Hello,
>>
>> 	You could try using a rate limit -- you could allow a machine to make
>> 	lets say 10 outbound
>> connections a second and then ...
>>
>> Depending on your network policy you could drop or log all other
>> outbound request.
>>
>
> This is what I'm planning to do.. and this is also the reason I was
> asking the questions in the original mail :-)
>
> -- Pasi K=E4rkk=E4inen
>
>                                   ^
>                                .     .
>                                 Linux
>                              /    -    \
>                             Choice.of.the
>                           .Next.Generation.




