From: "Frederic de Villamil" <neuro@seclab.jp>
Subject: Re: examining data portion of packet
Date: Wed, 24 Mar 2004 09:59:53 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <58774.192.54.193.137.1080118793.squirrel@mail.asocial.org>
References: <20040324054521.27142.qmail@web60002.mail.yahoo.com>
    <1080112737.2387.47.camel@raylinux.internal>
Reply-To: neuro@seclab.jp
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1080112737.2387.47.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


> On Wed, 2004-03-24 at 07:45, Sandy C wrote:
>>    I would like to be able to be able to examine the
>> data portion of a network packet after matching it.
>>
>>    I figured there would be some kind of target for
>> this, but there isn't...or at least I couldn't find
>> any.
>>
>>    What is the best way to go about this? Should I be
>> thinking of writing a target extension?
>>
> You could use something like ntop or tcpdump.
>
>> Thanks!
>> S C

Hi,
maybe you should try ethereal. It has some very powerfull filtering
functions that may fit your needs.

--=20
Fr=E9d=E9ric de Villamil.
Pr=E9sident Epitanime
Amez vos ennemis; ce n'est pas facile, mais ca va les emmerder.
neuro@seclab.jp                             http://www.seclab.jp

