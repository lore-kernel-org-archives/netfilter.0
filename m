From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: NTP
Date: Fri, 2 Jul 2004 09:28:26 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7EACCDBB65D37443912D80713CC1245D4728B9@fsnsab20.losangeles.af.mil>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: 'Gavin Hamill' <gdh@acentral.co.uk>, netfilter@lists.netfilter.org

do not i repeat...do not allow inbound ntp with a source port above the root
ports.



####################################
# delbert.hudson@losangeles.af.mil #
#        61cs/scbn, 3-0182         #
####################################


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Gavin Hamill
Sent: Friday, July 02, 2004 4:07 AM
To: netfilter@lists.netfilter.org
Subject: Re: NTP


On Friday 02 July 2004 11:57, Steve Comfort wrote:
> Hi all,
>
> Could someone tell me what rules I need in order to enable NTP?

Simply allow incoming UDP on port 123. The 'normal' way is for both the
source 
and destination ports to be 123, but it is common (esp. with debugging) for 
the source port to be >1024.

Cheers,
Gavin.

