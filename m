From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: Allow active and passive FTP connections
Date: Mon, 21 Jun 2004 12:18:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E8956F2@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Sagara Wijetunga <sagaralists@yahoo.com>, netfilter@lists.netfilter.org

If you find one (that works with TLS/SSL), please let me know :)
Sorry I have not seen one as of yet.

Justin.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Sagara
Wijetunga
Sent: Monday, June 21, 2004 11:43 AM
To: netfilter@lists.netfilter.org
Subject: RE: Allow active and passive FTP connections

--- "Piszcz, Justin Michael"
<justin.piszcz@mitretek.org> wrote:
> You are *NOT* running an (SSL) FTP daemon, correct?
> (The current
> conntrack module for FTP does _NOT_ support this).
>=20
You are right! I disabled SSL from the FTP server. Now
the RELATED rule *works* as I expected for both active
and passive FTP connections.

Thank you very much to highlight it to me. Is there a
workaround for this?

kind regards
Sagara




=09
	=09
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
http://promotions.yahoo.com/new_mail=20




