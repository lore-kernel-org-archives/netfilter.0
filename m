From: "Oscar Garcia" <alcoceba2002@hotmail.com>
Subject: packet mark
Date: Thu, 03 Apr 2003 17:07:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F636hdO9JZtD9SWLYaI00012e47@hotmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

I'm interested on marking a packet as do the option :
iptables -A OUTPUT -t mangle -jMARK --set-mark 1
but doing it in a program , there is any API to mark the packet ,without=20
having to execute an script with this instrucion.
Can I mark the buffer that holds the packet?
I know that iptables works in this way





_________________________________________________________________
Charla con tus amigos en l=EDnea mediante MSN Messenger: =20
http://messenger.microsoft.com/es


