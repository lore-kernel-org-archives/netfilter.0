From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Listening ports.
Date: Mon, 23 Sep 2002 19:45:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020923184554.EVZC27185.mta03-svc.ntlworld.com@there>
References: <000001c2632b$ab4b0840$6601a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c2632b$ab4b0840$6601a8c0@s3ac>
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

On Monday 23 September 2002 7:04 pm, Rowan Reid wrote:

> Is there a way to list listening ports per interface .. ? Or IP would be
> better.

nmap -sS -P0 111.222.333.444

for a TCP scan, or

nmap -sU -P0 111.222.333.444

for a UDP scan   :-)

Antony.
-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

