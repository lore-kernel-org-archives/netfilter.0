From: <Josh.Berry@compucom.com>
Subject: Linux HA with Bridge
Date: Tue, 30 Sep 2003 13:13:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0C7C6E1720E8D74FB52EBEF93649730A0119A522@2k099exm01.compucom.local>
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

Is it possible to have a Linux-HA setup with a bridge.  Example

=20
                     Internet
                         |
      |-------------- Switch ---------------|
      |                                     |
Bridge Interface                    Bridge Interface
      |                                     |
LinuxFirewall IP---- Heartbeat ----IP LinuxFirewall
	|						  |
Bridge Interface                    Bridge Interface
	|                                     |
	|-------------- Switch ---------------|
			       |
			    Network

Josh Berry
Information Security Group
972-856-5402


