// Copyright (c) 2023, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// IMPORTANT: This file should only ever be modified by modifying the
// corresponding .proto file and then running
// `dart runtime/vm/protos/tools/compile_perfetto_protos.dart` from the SDK root
// directory.
// Autogenerated by the ProtoZero compiler plugin. DO NOT EDIT.

#ifndef PERFETTO_PROTOS_PROTOS_PERFETTO_TRACE_CLOCK_SNAPSHOT_PROTO_H_
#define PERFETTO_PROTOS_PROTOS_PERFETTO_TRACE_CLOCK_SNAPSHOT_PROTO_H_

#include <stddef.h>
#include <stdint.h>

#include "perfetto/protozero/field_writer.h"
#include "perfetto/protozero/message.h"
#include "perfetto/protozero/packed_repeated_fields.h"
#include "perfetto/protozero/proto_decoder.h"
#include "perfetto/protozero/proto_utils.h"

namespace perfetto {
namespace protos {
namespace pbzero {

class ClockSnapshot_Clock;
enum BuiltinClock : int32_t;

class ClockSnapshot_Decoder : public ::protozero::TypedProtoDecoder<
                                  /*MAX_FIELD_ID=*/2,
                                  /*HAS_NONPACKED_REPEATED_FIELDS=*/true> {
 public:
  ClockSnapshot_Decoder(const uint8_t* data, size_t len)
      : TypedProtoDecoder(data, len) {}
  explicit ClockSnapshot_Decoder(const std::string& raw)
      : TypedProtoDecoder(reinterpret_cast<const uint8_t*>(raw.data()),
                          raw.size()) {}
  explicit ClockSnapshot_Decoder(const ::protozero::ConstBytes& raw)
      : TypedProtoDecoder(raw.data, raw.size) {}
  bool has_clocks() const { return at<1>().valid(); }
  ::protozero::RepeatedFieldIterator<::protozero::ConstBytes> clocks() const {
    return GetRepeated<::protozero::ConstBytes>(1);
  }
  bool has_primary_trace_clock() const { return at<2>().valid(); }
  int32_t primary_trace_clock() const { return at<2>().as_int32(); }
};

class ClockSnapshot : public ::protozero::Message {
 public:
  using Decoder = ClockSnapshot_Decoder;
  enum : int32_t {
    kClocksFieldNumber = 1,
    kPrimaryTraceClockFieldNumber = 2,
  };
  static constexpr const char* GetName() {
    return ".perfetto.protos.ClockSnapshot";
  }

  using Clock = ::perfetto::protos::pbzero::ClockSnapshot_Clock;

  using FieldMetadata_Clocks = ::protozero::proto_utils::FieldMetadata<
      1,
      ::protozero::proto_utils::RepetitionType::kRepeatedNotPacked,
      ::protozero::proto_utils::ProtoSchemaType::kMessage,
      ClockSnapshot_Clock,
      ClockSnapshot>;

  // Ceci n'est pas une pipe.
  // This is actually a variable of FieldMetadataHelper<FieldMetadata<...>>
  // type (and users are expected to use it as such, hence kCamelCase name).
  // It is declared as a function to keep protozero bindings header-only as
  // inline constexpr variables are not available until C++17 (while inline
  // functions are).
  // TODO(altimin): Use inline variable instead after adopting C++17.
  static constexpr FieldMetadata_Clocks kClocks() { return {}; }
  template <typename T = ClockSnapshot_Clock>
  T* add_clocks() {
    return BeginNestedMessage<T>(1);
  }

  using FieldMetadata_PrimaryTraceClock =
      ::protozero::proto_utils::FieldMetadata<
          2,
          ::protozero::proto_utils::RepetitionType::kNotRepeated,
          ::protozero::proto_utils::ProtoSchemaType::kEnum,
          ::perfetto::protos::pbzero::BuiltinClock,
          ClockSnapshot>;

  // Ceci n'est pas une pipe.
  // This is actually a variable of FieldMetadataHelper<FieldMetadata<...>>
  // type (and users are expected to use it as such, hence kCamelCase name).
  // It is declared as a function to keep protozero bindings header-only as
  // inline constexpr variables are not available until C++17 (while inline
  // functions are).
  // TODO(altimin): Use inline variable instead after adopting C++17.
  static constexpr FieldMetadata_PrimaryTraceClock kPrimaryTraceClock() {
    return {};
  }
  void set_primary_trace_clock(::perfetto::protos::pbzero::BuiltinClock value) {
    static constexpr uint32_t field_id =
        FieldMetadata_PrimaryTraceClock::kFieldId;
    // Call the appropriate protozero::Message::Append(field_id, ...)
    // method based on the type of the field.
    ::protozero::internal::FieldWriter<
        ::protozero::proto_utils::ProtoSchemaType::kEnum>::Append(*this,
                                                                  field_id,
                                                                  value);
  }
};

class ClockSnapshot_Clock_Decoder
    : public ::protozero::TypedProtoDecoder<
          /*MAX_FIELD_ID=*/2,
          /*HAS_NONPACKED_REPEATED_FIELDS=*/false> {
 public:
  ClockSnapshot_Clock_Decoder(const uint8_t* data, size_t len)
      : TypedProtoDecoder(data, len) {}
  explicit ClockSnapshot_Clock_Decoder(const std::string& raw)
      : TypedProtoDecoder(reinterpret_cast<const uint8_t*>(raw.data()),
                          raw.size()) {}
  explicit ClockSnapshot_Clock_Decoder(const ::protozero::ConstBytes& raw)
      : TypedProtoDecoder(raw.data, raw.size) {}
  bool has_clock_id() const { return at<1>().valid(); }
  uint32_t clock_id() const { return at<1>().as_uint32(); }
  bool has_timestamp() const { return at<2>().valid(); }
  uint64_t timestamp() const { return at<2>().as_uint64(); }
};

class ClockSnapshot_Clock : public ::protozero::Message {
 public:
  using Decoder = ClockSnapshot_Clock_Decoder;
  enum : int32_t {
    kClockIdFieldNumber = 1,
    kTimestampFieldNumber = 2,
  };
  static constexpr const char* GetName() {
    return ".perfetto.protos.ClockSnapshot.Clock";
  }

  using FieldMetadata_ClockId = ::protozero::proto_utils::FieldMetadata<
      1,
      ::protozero::proto_utils::RepetitionType::kNotRepeated,
      ::protozero::proto_utils::ProtoSchemaType::kUint32,
      uint32_t,
      ClockSnapshot_Clock>;

  // Ceci n'est pas une pipe.
  // This is actually a variable of FieldMetadataHelper<FieldMetadata<...>>
  // type (and users are expected to use it as such, hence kCamelCase name).
  // It is declared as a function to keep protozero bindings header-only as
  // inline constexpr variables are not available until C++17 (while inline
  // functions are).
  // TODO(altimin): Use inline variable instead after adopting C++17.
  static constexpr FieldMetadata_ClockId kClockId() { return {}; }
  void set_clock_id(uint32_t value) {
    static constexpr uint32_t field_id = FieldMetadata_ClockId::kFieldId;
    // Call the appropriate protozero::Message::Append(field_id, ...)
    // method based on the type of the field.
    ::protozero::internal::FieldWriter<
        ::protozero::proto_utils::ProtoSchemaType::kUint32>::Append(*this,
                                                                    field_id,
                                                                    value);
  }

  using FieldMetadata_Timestamp = ::protozero::proto_utils::FieldMetadata<
      2,
      ::protozero::proto_utils::RepetitionType::kNotRepeated,
      ::protozero::proto_utils::ProtoSchemaType::kUint64,
      uint64_t,
      ClockSnapshot_Clock>;

  // Ceci n'est pas une pipe.
  // This is actually a variable of FieldMetadataHelper<FieldMetadata<...>>
  // type (and users are expected to use it as such, hence kCamelCase name).
  // It is declared as a function to keep protozero bindings header-only as
  // inline constexpr variables are not available until C++17 (while inline
  // functions are).
  // TODO(altimin): Use inline variable instead after adopting C++17.
  static constexpr FieldMetadata_Timestamp kTimestamp() { return {}; }
  void set_timestamp(uint64_t value) {
    static constexpr uint32_t field_id = FieldMetadata_Timestamp::kFieldId;
    // Call the appropriate protozero::Message::Append(field_id, ...)
    // method based on the type of the field.
    ::protozero::internal::FieldWriter<
        ::protozero::proto_utils::ProtoSchemaType::kUint64>::Append(*this,
                                                                    field_id,
                                                                    value);
  }
};

}  // namespace pbzero
}  // namespace protos
}  // namespace perfetto
#endif  // Include guard.
