From: Roman Fiedler <roman.fiedler@ait.ac.at>
Subject: Re: Blocking all APNIC addresses vs. per-country list
Date: Mon, 26 Apr 2010 16:51:08 +0200
Message-ID: <4BD5A85C.1020703@ait.ac.at>
References: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net> <q2m56378e321004260719i6685af2arc8faa644f555485b@mail.gmail.com> <4BD5A487.3020407@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BD5A487.3020407@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hello list,

Besides connection limits, shouldn't it be possible to place the variou=
s
subnet rules in a sort of balanced/optimized tree to decrease the acces=
s
time? Are there tools available for that, that use e.g. the DROP log
entries from an unbalanced list to optimize the tree (like
huffman-encoding for data streams)? Can ipset do that?

Roman

--=20
Roman Fiedler
Safety & Security Department
Information Management & eHealth

AIT Austrian Institute of Technology GmbH
Reininghausstra=DFe 13/1  |  8020 Graz  |  Austria
T +43(0) 316 586570-63  |  M +43(0) 664 8251194  |  F +43(0) 316 586570=
-12
roman.fiedler@ait.ac.at <mailto:roman.fiedler@ait.ac.at> |
http://www.ait.ac.at <http://www.ait.ac.at/>
http://www.ait.ac.at/eHealth/ <http://www.ait.ac.at/eHealth/>

=46N: 115980 i HG Wien  |  UID: ATU14703506
This email and any attachments thereto, is intended only for use by the
addressee(s) named herein and may contain legally privileged and/or
confidential information. If you are not the intended recipient, please
notify the sender by return e-mail or by telephone and delete this
message from your system and any printout thereof. Any unauthorized use=
,
reproduction, or dissemination of this message is strictly prohibited.
Please note that e-mails are susceptible to change. AIT Austrian
Institute of Technology GmbH shall not be liable for the improper or
incomplete transmission of the information contained in this
communication, nor shall it be liable for any delay in its receipt.
