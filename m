From: Alex Satrapa <alex@lintelsys.com.au>
Subject: Re: Anybody heard about UP&P ?
Date: Mon, 23 Feb 2004 09:46:06 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4039312E.9080209@lintelsys.com.au>
References: <4035B3BC.6030901@randodetente.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4035B3BC.6030901@randodetente.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Marc Recht=E9 wrote:
> To enable remote assistance from Internet of a WinXP PC on a LAN using=20
> NAT one must have a UP&P NAT compatible router.

UPnP(tm) is basically SNMP done with SOAP instead of ASN.1, with some bits =
of ZeroConf thrown in for good measure.

It involves resource discovery, service discovery and property manipulation.

If you're interested, the specification for an "Internet Gateway Device" is=
 available from the UPnP website. Basically, the IGD allows (authorised) ma=
chines to request the gateway to do things such as:
 - Connect to the internet
 - report statistics
 - create a forwarded port

The "create a forwarded port" part is used by Remote Assistance as well as =
MSN Messenger.

These are not things that can be emulated in netfilter - you'll need a SOAP=
 service, and a whole bunch of other software to implement the IGD specific=
ation.

Last time I looked, some people had in fact implemented UPnP services for L=
inux, but I'm not sure whether IGD was implemented.

Regards
Alex


