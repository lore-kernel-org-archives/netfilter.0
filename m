From: "Jose Gonzalez" <jgonzalez@courtesycomputers.com>
Subject: Issues with DNAT and iproute2 equalize - packets sent out the wrong interface
Date: Thu, 10 Oct 2002 16:53:28 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4C20BCC79135594983F5C96CB377917690AE@cciex01.courtesycomputers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

I have two internet interfaces, the interfaces are equalized using =
iproute2.  The box is also performing DNAT and SNAT.  What occurs is =
sometimes is that remote users are unable to access the DNAT resource.  =
I troubleshoot to the packets going out the wrong interface.  If I add a =
static route for the remote host or I disable one of the internet lines =
then everything works ok again.  Can anyone help?  I can provide more =
technical details if some one has knowledge about this.  Thank you.


Confidentiality Notice:
This e-mail transmission may contain confidential or legally privileged =
information that is intended only for the individual or entity named in =
the e-mail address. If you are not the intended recipient, you are =
hereby notified that any disclosure, copying, distribution, or reliance =
upon the contents of this e-mail is strictly prohibited. If you have =
received this e-mail transmission in error, please reply to the sender, =
so that Courtesy Computers, Inc. can arrange for proper delivery, and =
then please delete the message from your Inbox. Thank you.

