From: <andy@digitalindustry.org>
Subject: Re: Re: dynamically update iptables with module ?
Date: Wed, 14 May 2003 11:59:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030514155938.IPXU1380.lakecmmtao03.coxmail.com@lakecm2mtao03>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=____1052927981008_l4om9+qpLc"
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
To: Calvin <calvinproject@ihug.com.au>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=____1052927981008_l4om9+qpLc
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

  For a different approach, consider this cisco-ish set of steps:

Create an "Access" user:  tom-acl, for example.
Mod that users login script to exec iptables commands.
  (use commands like 'who' to retreive your source IP, to aid in setting up dynamic rules)

use AT to close the ports after a given time:
`at now + 1 minute -f /etc/scripts/prod/close_ports.sh
  (the above 'AT' would be ok for SSH, but hot http, as once ssh establishes closing the port doesn't kill SSH, but http for instance constantly sends syn packets while browsing.

   You can use this approach to mod .allow and .deny files or daemon user files, or anything else you can think of.  Much more flexible if you looking to grant access based on user authentication.  Have the script auto-logoff the acl user so a regular user is forced to connect...just a little more paranoia thrown in for good measure.


> 
> From: Stephen Frost <sfrost@snowman.net>
> Date: 2003/05/14 Wed AM 08:37:30 EDT
> To: Calvin <calvinproject@ihug.com.au>
> CC: netfilter@lists.netfilter.org
> Subject: Re: dynamically update iptables with module ?
> 
> * Calvin (calvinproject@ihug.com.au) wrote:
> > I am a newbies in netfilter, just a question in my mind, would it be possible to dynamically changing the 
> > iptables from a module? For example, if i see a paticular message from a pc, then I update the iptable to allow outgoing communication frmo that pc.  Or there is some other way to achieve 
> > 
> > Is it possible to do it?
> 
> You should be able to do this with iptables and the ipt_recent module,
> assuming the 'message' can be matched using other iptables modules/rules.
> 
> > Or... is it possible that the iptables can be updated by a C++/C programe by executing a shell script to update the iptables?
> 
> That can probably be done too...
> 
> 	Stephen
> 
> 

------=____1052927981008_l4om9+qpLc
Content-Transfer-Encoding: base64
Content-Type: application/pgp-signature;
	name="replyAll"
Content-Disposition: inline;
	filename="replyAll"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuMSAo
R05VL0xpbnV4KQ0KDQppRDhEQlFFK3dqaUpyemdNUHFCM2tpZ1JBbnFNQUtDUnU0RnZWcGQx
VGUyaGdUWEJVZTlsZGtCL2pnQ2JCT1kwDQpLNWJjb2FiNjJ1OW1qZlhQeEVaZkhXYz0NCj13
RHdKDQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg0K
------=____1052927981008_l4om9+qpLc--


