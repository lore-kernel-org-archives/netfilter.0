From: Tom Smith <tom@openadventures.org>
Subject: Re: PPP Routing
Date: Thu, 27 Feb 2003 08:23:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E5E2D66.1050603@openadventures.org>
References: <3E5D008A.7070804@openadventures.org> <20030226225616.GA380@tekilla.homeip.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------000306070900080800020107"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030226225616.GA380@tekilla.homeip.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: wdyck@gmx.net
Cc: netfilter@lists.netfilter.org


--------------000306070900080800020107
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by uccinc.net id h1RFNhS13417

Thank you, this turned out to be the solution (ppp+).

Tom

Willi Dyck wrote:

>On Wed, Feb 26, 2003 at 10:59:38AM -0700, Tom Smith wrote:
> =20
>
>>RedHat 7.3 Kernel 2.4.9-31
>>iptables 1.2.5
>>
>>I have a working Firewall/VPN. Problem is that I need to create a=20
>>seperate set of rules for each ppp# connection. For example, ppp0's=20
>>ruleset would be:
>>
>>$IPTABLES -A INPUT -i ppp0 -s $INTNET -d $INTNET -j ACCEPT
>>$IPTABLES -A OUTPUT -o ppp0 -s $INTNET -d $INTNET -j ACCEPT
>>$IPTABLES -A FORWARD -i ppp0 -d $INTNET -j ACCEPT
>>$IPTABLES -A FORWARD -o ppp0 -d $INTNET -j ACCEPT
>>
>>Is there a way to dynamically create the ppp# as new connections come=20
>>and go?
>>   =20
>>
>
>You might try 'ppp+' instead of 'ppp0'. Although it might not be what
>you want, since it will not be loaded dynamically, but it will match
>dynamically for all ppp# interfaces. See the netfilter docs for further
>info. Hope that helps.
>
>Gru=DF/Regards -- Willi
>
> =20
>

--------------000306070900080800020107
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
</head>
<body>
Thank you, this turned out to be the solution (ppp+).<br>
<br>
Tom<br>
<br>
Willi Dyck wrote:<br>
<blockquote type="cite"
 cite="mid20030226225616.GA380@tekilla.homeip.net">
  <pre wrap="">On Wed, Feb 26, 2003 at 10:59:38AM -0700, Tom Smith wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">RedHat 7.3 Kernel 2.4.9-31
iptables 1.2.5

I have a working Firewall/VPN. Problem is that I need to create a 
seperate set of rules for each ppp# connection. For example, ppp0's 
ruleset would be:

$IPTABLES -A INPUT -i ppp0 -s $INTNET -d $INTNET -j ACCEPT
$IPTABLES -A OUTPUT -o ppp0 -s $INTNET -d $INTNET -j ACCEPT
$IPTABLES -A FORWARD -i ppp0 -d $INTNET -j ACCEPT
$IPTABLES -A FORWARD -o ppp0 -d $INTNET -j ACCEPT

Is there a way to dynamically create the ppp# as new connections come 
and go?
    </pre>
  </blockquote>
  <pre wrap=""><!---->
You might try 'ppp+' instead of 'ppp0'. Although it might not be what
you want, since it will not be loaded dynamically, but it will match
dynamically for all ppp# interfaces. See the netfilter docs for further
info. Hope that helps.

Gru&szlig;/Regards -- Willi

  </pre>
</blockquote>
</body>
</html>

--------------000306070900080800020107--



