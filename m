From: "dave beach" <drbeach@rogers.com>
Subject: RE: Logging question
Date: Fri, 11 Feb 2005 08:45:34 -0500
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAAjZiQvQAvHkmocpvcaRW9tgEAAAAA@rogers.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAA/2juzkSA1EqqQG7cqX3fCwEAAAAA@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAA/2juzkSA1EqqQG7cqX3fCwEAAAAA@rogers.com>
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
To: 'Samuel Jean' <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org

 
Hi Samuel -

> Of course, any minute now I'll actually TRY a few things and stop writing
messages about questions.

Seems to be working now after moving the logging rules to mangle/POSTROUTING
from nat/POSTROUTING; thanks very much for your help.


