From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: RE: Pid owner module
Date: Wed, 24 Jan 2007 13:50:33 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701241350260.32656@yvahk01.tjqt.qr>
References: <9772C290CD0BDF4B91356C9102BA886A0567BB66@ftrdmel1.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9772C290CD0BDF4B91356C9102BA886A0567BB66@ftrdmel1.rd.francetelecom.fr>
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
Content-Type: TEXT/PLAIN; charset="utf-8"
To: zze-FREDI POIROT N ext RD-MAPS-LAN <npoirot.ext@orange-ftgroup.com>
Cc: netfilter@lists.netfilter.org


>Do you have any idea/suggestion of how I could achieve such a filter ? (application-based filtering) ???

tuxguardian.sf.net



>
>
> 
>
>-----Message d'origine-----
>De : netfilter-bounces@lists.netfilter.org [mailto:netfilter-bounces@lists.netfilter.org] De la part de Pascal Hambourg
>Envoyé : mercredi 24 janvier 2007 11:16
>À : netfilter@lists.netfilter.org
>Objet : Re: Pid owner module
>
>Hello,
>
>zze-FREDI POIROT N ext RD-MAPS-LAN a écrit :
>> Jan 24 10:25:47 localhost kernel: ipt_owner: pid, sid and command 
>> matching not supported anymore
>[...]
>> 3. Since which kernel version has this module been disabled ?
>
>Found in Changelog-2.6.14 :
>   [NETFILTER]: Remove tasklist_lock abuse in ipt{,6}owner
>
>   Rip out cmd/sid/pid matching since its unfixable broken and stands in
>   the way of locking changes to tasklist_lock.
>
>
>

	-`J'
-- 

