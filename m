From: "=?UTF-8?B?TWljaGFlbCBKw7xyZ2Vucw==?=" <netfilter@juergens.name>
Subject: providing partial access to iptables for non root user
Date: Mon, 21 Feb 2005 12:33:05 +0100
Message-ID: <4219C6F1.2070500@juergens.name>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I=C2=B4m looking for a solution to provide a non root user write access =
to a 
chain.

In this special case I have to provide the a mechanism to block some ip 
adresses to connect to http.
But this should be done by a non root user. The non root user should not=
 
change any other rule.

Any ideas?

regards,
Michael


