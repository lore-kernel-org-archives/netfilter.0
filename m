From: "Shinju" <shinju@eaglespoint.net>
Subject: mangle table traversal
Date: Thu, 20 Jun 2002 15:16:23 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <007301c21897$5a1d6780$4c14040a@grdhd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hey folks.

Do packets always traverse the chain in the 'mangle' table before they
traverse the corresponding chain in other tables?  In other words, is this
flow correct?...

...manglePREROUTING --> natPREROUTING...
...mangleINPUT --> filterINPUT...
...mangleOUTPUT --> natOUTPUT --> filterOUTPUT...
...mangleFORWARD --> filterFORWARD...
...manglePOSTROUTING --> natPOSTROUTING...

thanks



