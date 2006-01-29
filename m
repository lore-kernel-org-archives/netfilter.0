From: Claudio Roberto Cussuol <claudio@brazilfw.com.br>
Subject: Fwd: Re: How can i see a list of applied p-o-m patches
Date: Sun, 29 Jan 2006 09:33:05 -0200
Message-ID: <20061299335.268713@xp>
References: <43DBFAEC.3090807@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DBFAEC.3090807@arcoscom.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Solved. I did the following:

./runme all > tempfile

As I could not see the messages i pressed enter around fifty times to not=
 apply 
any patch.

Then:

grep ^Testing tempfile

Show me a list with the lines started by Testing, Example:
Testing ipp2p... Not Applied
Testing rpc... Not Applied
Testing string... Applied

That was what i need.



Runme help shows the following option:
-- check   check mode, automaticaly checks if patches are alreay applied.
              produces a logfile: rune.out-check


(Note 2 tipos: alreay and rune.out-check)

However it just does nothing, I tried to run several times and could not=
 find 
the runme.out-check file.


