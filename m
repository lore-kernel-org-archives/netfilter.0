From: "rruegner" <robowarp@gmx.de>
Subject: Re: Anybody heard about UP&P ?
Date: Mon, 23 Feb 2004 15:58:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c3fa1d$72ac35b0$32640a0a@robopc>
References: <739652C2AFA4834AAB5986A215F68CEC0165AF@svr1.home.compsup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Carl Farrington <carl@compsup.net>, netfilter@lists.netfilter.org

hi, this is the current art of design  of uni plug an play
http://linux-igd.sourceforge.net/ on linux
Regards

----- Original Message -----=20
From: "Carl Farrington" <carl@compsup.net>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, February 22, 2004 11:55 PM
Subject: RE: Anybody heard about UP&P ?


> From: Alex Satrapa [mailto:alex@lintelsys.com.au]
> Sent: 22 February 2004 22:46
> To: netfilter@lists.netfilter.org
> Subject: Re: Anybody heard about UP&P ?
>
> Marc Recht=E9 wrote:
> > To enable remote assistance from Internet of a WinXP PC on a LAN using
> > NAT one must have a UP&P NAT compatible router.
>
> UPnP(tm) is basically SNMP done with SOAP instead of ASN.1, with some bits
> of ZeroConf thrown in for good measure.
>
> It involves resource discovery, service discovery and property
> manipulation.
>
> If you're interested, the specification for an "Internet Gateway Device"
> is available from the UPnP website. Basically, the IGD allows (authorised)
> machines to request the gateway to do things such as:
>  - Connect to the internet
>  - report statistics
>  - create a forwarded port
>
> The "create a forwarded port" part is used by Remote Assistance as well as
> MSN Messenger.
>
> These are not things that can be emulated in netfilter - you'll need a
> SOAP service, and a whole bunch of other software to implement the IGD
> specification.
>
> Last time I looked, some people had in fact implemented UPnP services for
> Linux, but I'm not sure whether IGD was implemented.
>

http://linux-igd.sourceforge.net/  looks to be the thing. Not yet working
with Microsoft products though.


