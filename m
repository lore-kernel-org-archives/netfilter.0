From: Andre Majorel <aym-retliften@teaser.fr>
Subject: Distinguishing between local FTP uploads and remote FTP downloads
Date: Sat, 8 Jan 2005 15:06:40 +0100
Message-ID: <20050108140640.GA18766@teaser.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

For traffic shaping purposes, I'd like to distinguish (-j MARK)
between ftp-data packets resulting from me uploading something to
a remote host and ftp-data packets resulting from a remote
download from me.

The goal is, of course, to be able to upload at full speed without
letting remote hosts hog my upload bandwidth at the same time.

Is there any way to do that ?

Thanks in advance.

--=20
Andr=E9 Majorel <URL:http://www.teaser.fr/~amajorel/>
Do not use this account for regular correspondence.
See the URL above for contact information.

