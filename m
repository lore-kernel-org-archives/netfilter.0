From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Mon, 17 Jun 2002 20:34:05 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206171934.g5HJY6A17880@Networker.rockstone.co.uk>
References: <000d01c21630$635a51a0$8147370a@washingtghv9lt> <200206171917.g5HJHBA16918@Networker.rockstone.co.uk> <20020617193001.GF22025@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020617193001.GF22025@cannon.eng.us.uu.net>
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

On Monday 17 June 2002 8:30 pm, Ramin Alidousti wrote:

> I'd recommend to have "-m state --state ESTABLISHED,RELATED"
> for all the predefined chains in the filter table. One should enforce
> the security on "NEW". Much less headache that way...

Yup.   I agree.

 

Antony.

